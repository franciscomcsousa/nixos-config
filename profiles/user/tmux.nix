{ pkgs, ... }:
let

  catppuccin = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "catppuccin";
    name = "catppuccin";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "tmux";
      rev = "e7cd05facc22c18fbab3f718d8ecd6494538fe38";
      sha256 = "sha256-Sz5o4redRQYNiniwTeFhndGXerVBNGrza6GcKziLdQc=";
    };
  };

in
{
  programs.tmux = {
    enable = true;
    historyLimit = 100000;
    plugins = with pkgs; [

      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha' # latte,frappe, macchiato or mocha
        '';
      }

      {
        plugin = pkgs.tmuxPlugins.tilish;
        extraConfig = ''
          set -g @tilish-navigator 'on'
          set -g @tilish-shiftnum '!"#$%&/()='
          set -g @tilish-default 'main-vertical'
        '';
      }

      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
    ];
    extraConfig = ''
            set -g mouse on
      			set-option -g default-terminal "screen-256color"
      			set-option -sa terminal-features ',alacritty:RGB'
            set-window-option -g mode-keys vi
            set -g base-index 1
            setw -g pane-base-index 1
            set -sg escape-time 0
    '';
  };
}
