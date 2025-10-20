{ ... }:
{
  services.udev.extraRules = ''
    # Corsair devices for liquidctl / CoolerControl
    ATTRS{idVendor}=="1b1c", MODE="0666"
  '';

  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };
}
