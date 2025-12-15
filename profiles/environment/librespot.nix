{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.librespot
    pkgs.alsa-utils
    pkgs.pipewire
  ];

  systemd.user.services.librespot = {
    description = "Spotify Connect (librespot)";
    after = [ "pipewire.service" ];
    wants = [ "pipewire.service" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.librespot}/bin/librespot --name \"HomeServer\" --device-type \"speaker\" --backend \"alsa\" --device \"pipewire\" --enable-oauth --cache %h/.cache/librespot --verbose";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
