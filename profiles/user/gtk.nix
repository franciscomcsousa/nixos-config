{ pkgs, configDir, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    #theme = {
    #  package = pkgs.graphite-gtk-theme;
    #  name = "Graphite-Dark";
    #};
    #cursorTheme = {
    #  package = pkgs.graphite-cursors;
    #  name = "graphite-dark";
    #};
  };
}
