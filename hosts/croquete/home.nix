{ pkgs, profiles, configDir, ... }:
let
  requiredPackages = with pkgs;
    [
      bat
      brave
      discord
      exiftool
      firefox
      fzf
      gcc
			gimp
      go
			gnomeExtensions.battery-health-charging
      gnumake
			handbrake
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      libreoffice-still
			mattermost-desktop
      mutter
      libreoffice-still
      neofetch
      nodejs_22
      obs-studio
      obsidian
      openjdk
      prismlauncher
      python3
      rclone
      ripgrep
      unstable.spotify
      thunderbird
      unzip
			vagrant
      vscode
      zip
      zoom-us
    ];
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit configDir;
    };
  };

  home-manager.users."francisco" = { pkgs, configDir, ... }: {
    imports = with profiles.user;
      [
        alacritty
        git
        gtk
        kitty
        neovim
        scalling
        starship
        tmux
        yazi
        zsh
      ];

    home = {
      username = "francisco";
      homeDirectory = "/home/francisco";
      stateVersion = "24.05";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    home.packages = requiredPackages;
  };
}
