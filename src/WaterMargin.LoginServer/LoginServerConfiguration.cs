using Humanizer;

namespace WaterMargin.LoginServer.Logic;

public class LoginServerConfiguration
{

    public string IpAddress { get; set; }
    public int PortNumber { get; set; }

    /// <summary>`
    /// List of all game server api keys so that we can get the current status
    /// and definitions.  
    /// </summary>
    public Dictionary<string,string> GameServerApiURIKeyPairs { get; set; }
}