using Humanizer;

namespace WaterMargin.LoginServer.Config;

public class LoginServerConfiguration
{

    /// <summary>`
    /// List of all game server api keys so that we can get the current status
    /// and definitions.  
    /// </summary>
    public Dictionary<string,string> GameServerApiURIKeyPairs { get; set; }
}