{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.librespot
    pkgs.alsa-utils
  ];

  users.users.librespot = {
    isSystemUser = true;
    group = "audio";
    home = "/var/lib/librespot";
    createHome = true;
    description = "Librespot (spotify connect) user";
  };

  systemd.services.librespot = {
    description = "Librespot (Spotify Connect)";
    after = [
      "sound.target"
      "pipewire.service"
    ];
    wants = [ "pipewire.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "librespot";
      Group = "audio";

      ExecStart = "${pkgs.librespot}/bin/librespot \
          --name \"HomeServer\" \
          --device-type \"speaker\" \
          --backend \"alsa\" \
          --device \"pipewire\" \
          --enable-oauth \
          --cache /var/lib/librespot/.cache \
          --verbose";

      Restart = "always";
      RestartSec = 5;

      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = true;
      ReadWritePaths = [
        "/var/lib/librespot"
        "/run"
      ];
    };
  };
}
