{...}: {
  programs.kitty = {
    enable = true;
		shellIntegration.enableZshIntegration = true;
		settings = {
			hide_window_decorations = true; 
			window_padding_width = "0 5"; 
			shell = "tmux";
		};
  };
}
