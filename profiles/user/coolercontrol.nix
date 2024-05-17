{ pkgs, ...}: {
  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };
}