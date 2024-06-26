{pkgs, ...}: {
  
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.image = ./wallpaper.png;

  stylix.fonts = {
    monospace = {
      package = (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];});
      name = "JetBrainsMono Nerd Font Mono";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

  };

  stylix.targets.gtk.enable = false;

}