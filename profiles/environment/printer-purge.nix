{ ... }: {
  systemd.services.print-job = {
    description = "Purge Printer";
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [ "/run/current-system/sw/bin/lpr -P EPSON_ET_2850_Series /home/francisco/printer_purge_page.pdf" ];
    };
  };

  systemd.timers.print-job = {
    description = "Purge Printer Every Saturday at 12:00";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "Sat 12:00";
      Persistent = true;
    };
  };
}
