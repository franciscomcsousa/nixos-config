{ pkgs, ... }:
{
  systemd.services.discord-bot = {
    description = "Discord Bot";
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    
    path = with pkgs; [ go gcc ];
    
    serviceConfig = {
      Type = "simple";
      User = "francisco";
      Group = "users";
      WorkingDirectory = "/home/francisco/discord-bot";
      ExecStart = "${pkgs.go}/bin/go run ./cmd/bot";
      Restart = "always";
      RestartSec = "10";
      
      NoNewPrivileges = true;
      PrivateTmp = true;
    };
  };
}
