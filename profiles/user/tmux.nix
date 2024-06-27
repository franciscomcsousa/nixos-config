{ pkgs, ... }:
let
  tmux-super-fingers = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-super-fingers";
      version = "unstable-2023-01-06";
      src = pkgs.fetchFromGitHub {
        owner = "artemave";
        repo = "tmux_super_fingers";
        rev = "2c12044984124e74e21a5a87d00f844083e4bdf7";
        sha256 = "sha256-cPZCV8xk9QpU49/7H8iGhQYK6JwWjviL29eWabuqruc=";
      };
    };

  catppuccin = pkgs.tmuxPlugins.mkTmuxPlugin 
    {
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
        plugin = tmux-super-fingers;
        extraConfig = "set -g @super-fingers-key f";
      }

      {
        plugin = catppuccin;
        extraConfig = ''
        set -g @catppuccin_flavour 'mocha' # latte,frappe, macchiato or mocha
        '';
      }

      {
        plugin = pkgs.tmuxPlugins.tilish;
        extraConfig = ''
          set -g @tilish-dmenu 'on'
          set -g @tilish-navigator 'on'
          set -g @tilish-shiftnum '!"#$%&/()='
        '';
      }

      tmuxPlugins.better-mouse-mode
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
