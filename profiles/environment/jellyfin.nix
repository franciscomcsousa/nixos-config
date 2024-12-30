{ pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

	# Exit node configuration
	boot.kernel.sysctl = { 
		"net.ipv4.ip_forward" = 1; 
		"net.ipv6.conf.all.forwarding" = 1;
	};
}
