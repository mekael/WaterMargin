
using WaterMargin.LoginServer.Data.Models;

namespace WaterMargin.LoginServer.Logic.Network
{
    public class GlobalLoginServerState
    {
        public Dictionary<int, AuthorizedSession> AuthorizedSessions { get; set; } = new Dictionary<int, AuthorizedSession>();
        public Dictionary<string, int> UserNameToIdMap { get; set; } = new Dictionary<string, int>();
        public List<GameServerItem> GameServers { get; set; } = new List<GameServerItem>();

        public int CreateNewSession(Guid userId, string userName, string clientVersion, string clientIpAddress, string password)
        {

            this.UserNameToIdMap.TryGetValue(userName, out int sessionId);
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
            this.AuthorizedSessions.Add(nonce, new AuthorizedSession(userId, userName, clientVersion, clientIpAddress, password, nonce));
            this.UserNameToIdMap[userName] = nonce;
            return nonce;
        }

    }
}
