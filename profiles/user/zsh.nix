{
  pkgs,
  profiles,
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

	};
}
