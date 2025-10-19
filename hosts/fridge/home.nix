{ pkgs, profiles, configDir, ... }:
let
  requiredPackages = with pkgs; [
    audacity
    bat
    bear
    brave
    clang-tools
    discord
    exiftool
    firefox
    fzf
    gcc
    gdb
    gimp
    go
    gnumake
    handbrake
    inkscape
    libreoffice-still
    liquidctl
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    mattermost-desktop
		nixfmt-rfc-style
    neofetch
    jre8
    nodejs_22
    obs-studio
    obsidian
    openrgb-with-all-plugins
    unstable.prismlauncher
    python3
    rclone
    ripgrep
    unstable.spotify
    scrcpy
    unstable.texliveFull
    thunderbird
    unzip
    vagrant
    vscode
    waydroid
    zip
    zoom-us
  ];
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit configDir; };
  };

  home-manager.users."francisco" = { pkgs, configDir, ... }: {
    imports = with profiles.user; [
      alacritty
      git
      gtk
      kitty
      neovim
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
