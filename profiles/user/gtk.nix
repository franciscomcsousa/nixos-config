{ pkgs, configDir, ...}: {
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
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
