{ pkgs, ... }:
{
  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers.modded = {
      enable = true;
      openFirewall = true;
      package = pkgs.neoforgeServers.neoforge-26_3-26_3_0_95;
      jvmOpts = "-Xms2G -Xmx4G";
    };
  };
}
