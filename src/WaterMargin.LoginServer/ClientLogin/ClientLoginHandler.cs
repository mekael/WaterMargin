using System.Net;
using Humanizer;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using SuperSocket.Command;
using SuperSocket.Server.Abstractions.Session;
using WaterMargin.LoginServer.Data;
using WaterMargin.LoginServer.Data.Models;
using WaterMargin.LoginServer.Logic.Network;
using WaterMargin.Shared;
using WaterMargin.Shared.Crypto;
using WaterMargin.Shared.SuperSocket;

namespace WaterMargin.LoginServer.Logic.ClientLogin
{

    [Command(Key = 1, Name = "Login")]

    public class ClientLoginHandler : IAsyncCommand<WaterMarginKeyedPackage>
    {
        private readonly ILogger<ClientLoginHandler> _logger;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly PasswordHasher<ApplicationUser> _passwordHasher;
        private readonly AuthDbContext _AuthDbContext;
        private readonly GlobalLoginServerState _globalLoginServerState;



        public ClientLoginHandler(ILogger<ClientLoginHandler> logger, UserManager<ApplicationUser> userManager,
         AuthDbContext AuthDbContext, GlobalLoginServerState globalLoginServerState, PasswordHasher<ApplicationUser> passwordHasher)
        {
            this._logger = logger;
            this._userManager = userManager;
            this._AuthDbContext = AuthDbContext;
            this._globalLoginServerState = globalLoginServerState;
            this._passwordHasher=passwordHasher;
        }


        public ValueTask ExecuteAsync(IAppSession session, WaterMarginKeyedPackage package, CancellationToken cancellationToken)
        {
            string address = ((IPEndPoint)session.Connection.RemoteEndPoint).Address.ToString();

            ClientLoginPacket clientLoginPacket = new ClientLoginPacket(package, address);
            var sessionSpecificKey = CryptoHelperUtil.DeriveConnectionKey(CryptoHelperUtil.DefaultKey, "1.5", clientLoginPacket.Username);

            ClientLoginResponsePacket clientLoginPacketResponse = this.Handle(clientLoginPacket, address, session.SessionID);
            byte[] encryptedData = CryptoHelperUtil.Encrypt(clientLoginPacketResponse.BuildPacket(), sessionSpecificKey);
            byte[] finalPacket = Utils.AddHeader(encryptedData);

            return session.SendAsync(finalPacket);
        }

        public ClientLoginResponsePacket Handle(ClientLoginPacket clientLoginPacket, string clientIpAddress, string clientSessionId)
        {

            if (this._globalLoginServerState.GameServers.Count == 0)
            {
                this._logger.LogError("clientSessionId {ClientSessionId} => No game servers available at the moment", clientSessionId);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }

            // check to make sure we've got a valid packet. 
            if (!clientLoginPacket.ValidPacket)
            {
                this._logger.LogError("clientSessionId {ClientSessionId} => Invalid login packet provided by client", clientSessionId);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }

            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName}=> ", clientSessionId, clientLoginPacket.Username);

            // check to make sure the account exists
            ApplicationUser applicationUser = this._userManager.FindByNameAsync(clientLoginPacket.Username).Result;

            //TODO: Decide if we want to implement immediate account creation

            if (applicationUser == null)
            {
                this._logger.LogError("clientSessionId {ClientSessionId}  username {UserName} => User not found in auth db", clientSessionId, clientLoginPacket.Username);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }
            // if the user hasn't completed the signup process or is a cat then leave right away. 
            else if (applicationUser.LockoutEnabled)
            {
                this._logger.LogError("clientSessionId {ClientSessionId}  username {UserName} => User is currently locked out.", clientSessionId, clientLoginPacket.Username);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }
            // 
            else if (applicationUser.IsCurrentlyBanned)
            {
                //TODO: decide if we want to extend the player ban if they attempt to login multiple times. 
                this._logger.LogError("clientSessionId {ClientSessionId}  username {UserName} => The user is currently banned", clientSessionId, clientLoginPacket.Username);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }

            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName} => Attempting to login via password.", clientSessionId, clientLoginPacket.Username);

            // if the user can't login (bad username/password most likely) 
            PasswordVerificationResult passwordVerificationResult = this._passwordHasher.VerifyHashedPassword(applicationUser, applicationUser.PasswordHash, clientLoginPacket.Password);
 
            if (passwordVerificationResult != PasswordVerificationResult.Success)
            {
                this._logger.LogError("clientSessionId {ClientSessionId}  username {UserName} => Unable to successfully login.", clientSessionId, clientLoginPacket.Username);
                return ClientLoginResponsePacket.GetDefaultInvalidPacket();
            }
            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName} => Able to login as user, generating new session", clientSessionId, clientLoginPacket.Username);

            int sessionId = this._globalLoginServerState.CreateNewSession(applicationUser.Id, applicationUser.UserName, "1.5", clientIpAddress, clientLoginPacket.Password);


            LoginTrackingItem loginTrackingItem = new LoginTrackingItem(applicationUser.Id, "1.5", clientIpAddress, sessionId);
            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName} => New session created with id {Nonce}.", clientSessionId, clientLoginPacket.Username, sessionId);
            this._logger.LogInformation("clientSessionId {ClientSessionId}  username {UserName} => Updating login tracking table", clientSessionId, clientLoginPacket.Username);


            try
            {
                this._AuthDbContext.LoginTrackingItems.Add(loginTrackingItem);
                this._AuthDbContext.SaveChanges();
            }
            catch (Exception ex)
            {
                this._logger.LogError(ex, "clientSessionId {ClientSessionId}  username {UserName}=> Error while updating login tracking table", clientSessionId, clientLoginPacket.Username);
            }

            //TODO: add a call to all game servers to kill off the existing sessions for this user. 

            return new ClientLoginResponsePacket(sessionId, this._globalLoginServerState.GameServers);
        }
    }
}