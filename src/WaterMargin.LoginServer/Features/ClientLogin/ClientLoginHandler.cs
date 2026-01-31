using System.Net;
using Humanizer;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using SuperSocket.Command;
using SuperSocket.Server.Abstractions.Session;
using WaterMargin.Auth.Data;
using WaterMargin.Auth.Data.Models;
using WaterMargin.LoginServer.Sys;
using WaterMargin.LoginServer.Utilities;
using WaterMargin.Shared;
using WaterMargin.Shared.Packets;
using WaterMargin.Shared.SuperSocket;

namespace WaterMargin.LoginServer.Features.ClientLogin
{

    [Command(Key = 1, Name = "Login")]

    public class ClientLoginHandler : IAsyncCommand<WaterMarginKeyedPackage>
    {
        private readonly ILogger<ClientLoginHandler> _logger;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly PasswordHasher<ApplicationUser> _passwordHasher;
        private readonly AuthDbContext _authDbContext;
        private readonly GlobalLoginServerState _globalLoginServerState;



        public ClientLoginHandler(ILogger<ClientLoginHandler> logger, UserManager<ApplicationUser> userManager,
         AuthDbContext AuthDbContext, GlobalLoginServerState globalLoginServerState, PasswordHasher<ApplicationUser> passwordHasher)
        {
            this._logger = logger;
            this._userManager = userManager;
            this._authDbContext = AuthDbContext;
            this._globalLoginServerState = globalLoginServerState;
            this._passwordHasher=passwordHasher;
        }


        public ValueTask ExecuteAsync(IAppSession session, WaterMarginKeyedPackage clientPacket, CancellationToken cancellationToken)
        {
            string address = ((IPEndPoint)session.Connection.RemoteEndPoint).Address.ToString();
            var parsedPacket = ReadInPacket(clientPacket.Body, session.SessionID);

            var sessionSpecificKey = CryptoHelperUtil.DeriveConnectionKey(CryptoHelperUtil.DefaultKey, "1.5", parsedPacket.username);

            ClientLoginResponsePacket clientLoginPacketResponse = this.Handle(parsedPacket.username, parsedPacket.password, parsedPacket.isValid, address, session.SessionID);

            Console.WriteLine(Utils.GetDataAsPrettyHex(clientLoginPacketResponse.BuildPacket()));
            byte[] encryptedData = CryptoHelperUtil.Encrypt(clientLoginPacketResponse.BuildPacket(), sessionSpecificKey);
            byte[] finalPacket = Utils.AddHeader(encryptedData);

            return session.SendAsync(finalPacket);
        }

        (string username, string password, bool isValid) ReadInPacket(byte[] packet, string clientSessionId) 
        {
            using PacketReader packetReader = new PacketReader(packet);
            packetReader.ReadByte();
            string username = packetReader.ReadNullTerminatedString();
            string password = packetReader.ReadNullTerminatedString();

            bool isValid = !string.IsNullOrWhiteSpace(username) && !string.IsNullOrWhiteSpace(password);
            return (username, password, isValid);
        }

        public ClientLoginResponsePacket Handle(  string username, string password, bool isValid, string clientIpAddress, string clientSessionId)
        {

            if (this._globalLoginServerState.GameServers.Count == 0)
            {
                this._logger.LogError("clientSessionId {ClientSessionId} => No game servers available at the moment", clientSessionId);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }

            // check to make sure we've got a valid packet. 
            if (!isValid)
            {
                this._logger.LogError("clientSessionId {ClientSessionId} => Invalid login packet provided by client", clientSessionId);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }

            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName}=> ", clientSessionId, username);

            // check to make sure the account exists
            ApplicationUser applicationUser = this._userManager.FindByNameAsync(username).Result;

            //TODO: Decide if we want to implement immediate account creation

            if (applicationUser == null)
            {
                this._logger.LogError("clientSessionId {ClientSessionId}  username {UserName} => User not found in auth db", clientSessionId, username);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }

            // 
            else if (applicationUser.IsCurrentlyBanned)
            {
                //TODO: decide if we want to extend the player ban if they attempt to login multiple times. 
                this._logger.LogError("clientSessionId {ClientSessionId}  username {UserName} => The user is currently banned", clientSessionId, username);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }

            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName} => Attempting to login via password.", clientSessionId, username);

            // if the user can't login (bad username/password most likely) 
            PasswordVerificationResult passwordVerificationResult = this._passwordHasher.VerifyHashedPassword(applicationUser, applicationUser.PasswordHash, password);
 
            if (passwordVerificationResult != PasswordVerificationResult.Success)
            {
                this._logger.LogError("clientSessionId {ClientSessionId}  username {UserName} => Unable to successfully login.", clientSessionId, username);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }
            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName} => Able to login as user, generating new session", clientSessionId, username);

            int sessionId = this._globalLoginServerState.CreateNewSession(applicationUser, "1.5", clientIpAddress, password);


            LoginTrackingItem loginTrackingItem = new LoginTrackingItem(applicationUser.Id, "1.5", clientIpAddress, sessionId);
            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName} => New session created with id {Nonce}.", clientSessionId, username, sessionId);
            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName} => Updating login tracking table", clientSessionId, username);

            try
            {
                this._authDbContext.Entry(applicationUser).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                this._authDbContext.LoginTrackingItems.Add(loginTrackingItem);
                this._authDbContext.SaveChanges();
            }
            catch (Exception ex)
            {
                this._logger.LogError(ex, "clientSessionId {ClientSessionId}  username {UserName}=> Error while updating login tracking table", clientSessionId, username);
            }
            //TODO: add a call to all game servers to kill off the existing sessions for this user. 
            return new ClientLoginResponsePacket(sessionId, this._globalLoginServerState.GameServers);
        }
    }
}