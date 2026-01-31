using WaterMargin.Auth.Data.Models;
using WaterMargin.LoginServer.Logic;

namespace WaterMargin.LoginServer.Sys
{
    public class GlobalLoginServerState
    {
        public Dictionary<int, AuthorizedSession> AuthorizedSessions { get; set; } = new Dictionary<int, AuthorizedSession>();
        public Dictionary<string, int> UserNameToIdMap { get; set; } = new Dictionary<string, int>();
        public List<GameServerInformation> GameServers { get; set; } = new List<GameServerInformation>();

        public int CreateNewSession(ApplicationUser appplicationUser, string clientVersion, string clientIpAddress, string password)
        {

            this.UserNameToIdMap.TryGetValue(appplicationUser.UserName, out int sessionId);
            if (sessionId != 0 && this.AuthorizedSessions.ContainsKey(sessionId))
            {
                this.AuthorizedSessions.Remove(sessionId);
            }

            var rand = new Random();

            int nonce = rand.Next(1, int.MaxValue);
            while (AuthorizedSessions.ContainsKey(nonce))
            {
                nonce = rand.Next(1, int.MaxValue);
            }
            this.AuthorizedSessions.Add(nonce, new AuthorizedSession(appplicationUser, clientVersion, clientIpAddress, password, nonce));
            this.UserNameToIdMap[appplicationUser.UserName] = nonce;
            return nonce;
        }

    }
}
