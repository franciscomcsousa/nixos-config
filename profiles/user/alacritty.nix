{...}:
{
	programs.alacritty = {
		enable = true;
		settings = {
			shell.program = "tmux";
			window = {
				padding.x = 10;
				decorations = "None";
			};
		};
	};
}
