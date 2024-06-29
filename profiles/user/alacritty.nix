{ pkgs, ...}:
{
  programs.alacritty = {
    enable = true;
		settings = {
			window = {
        padding.x = 10;
        decorations = "None";
      };
		};
  };
}
