
{...}: {
  programs.yazi = {
    enable = true;
		settings = {
			opener = {
				edit = [ 
					{
						run = "nvim \"$@\"";
					} 
				];
				open = [ 
					{
						run = "xdg-open \"$@\"";
						desc = "Open";
					} 
				];
			};
		};
		keymap = {
			 manager = {
				prepend_keymap = [
					{
						on = ["t"];
						run = "shell \"tmux split-window \"nvim \"$0\"\"\"--orphan";
						desc = "Open file in new tmux pane";
					}
				]; 
			};
		};
  };
}
