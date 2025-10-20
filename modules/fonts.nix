{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      dejavu_fonts
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];
  };
}
