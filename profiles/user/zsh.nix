{
  ...
}: {
	programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
		autocd = true;
    syntaxHighlighting = {
      enable = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "fzf"];
    };

		shellAliases = {
			onedrive = "rclone --vfs-cache-mode writes mount OneDrive: ~/OneDrive > /dev/null 2>&1 &!";
		};
	};
}
