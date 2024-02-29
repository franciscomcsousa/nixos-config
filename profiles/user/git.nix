{pkgs, ...}: {
  programs.git = {
    enable = true;
    userEmail = "francisco.m.c.sousa@gmail.com";
    userName = "franciscomcsousa";
    extraConfig = {
      init.defaultBranch = "main";
      url."git@github.com".pushinsteadOf = "https://github.com";
      color.ui = true;
      pull.rebase = true;
			user.signingkey = "58677D63526D84FC";
      commit.sign = "true";	
      core.editor = "nvim";
    };	
	};
}
