{ pkgs, ... }:
{

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    package = pkgs.unstable.cups;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true; # Enable mDNS hostname resolution
    openFirewall = true;
  };

}
