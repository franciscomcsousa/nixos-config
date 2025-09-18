{ pkgs, profiles, ... }:
{
  imports =
    [
      profiles.environment.desktop.gnome.default
    ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.display-configuration-switcher
    gnomeExtensions.vitals
    gnome-tweaks
  ];

  services.displayManager = {
    preStart = "sleep 5";
    autoLogin.enable = true;
    autoLogin.user = "francisco";

  };
  # services.xserver.displayManager.gdm.wayland = false;
}
