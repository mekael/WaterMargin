namespace WaterMargin.LoginServer.Logic
{
    public class GameServerInformation
    {
        public string ApiURI { get; set; }
        public string GroupId {get;set;}
        public string ServerId {get;set;}
        public string GroupName { get; set; }
        public string ServerName { get; set; }
        public string HostIpAddress { get; set; }
        public short Port { get; set; }
        public short Concurrent { get; set; }
        public short MaxLoading { get; set; }
        public byte CurrentState { get; set; }
    }
}