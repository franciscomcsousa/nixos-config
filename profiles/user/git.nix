{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.email = "francisco.m.c.sousa@gmail.com";
      user.name = "franciscomcsousa";
      init.defaultBranch = "main";
      # url."git@github.com".pushinsteadOf = "https://github.com";
      color.ui = true;
      pull.rebase = true;
      user.signingkey = "58677D63526D84FC";
      commit.gpgsign = "true";
      core.editor = "nvim";
    };
  };
}
