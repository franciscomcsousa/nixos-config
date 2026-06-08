{
  pkgs,
  profiles,
  configDir,
  ...
}:
let
  requiredPackages = with pkgs; [
    bat
    brave
    discord
    evince
    exiftool
    fastfetch
    firefox
    fzf
    gcc
    gimp
    go
    gnomeExtensions.battery-health-charging
    gnomeExtensions.dynamic-panel
    gnumake
    handbrake
    htop
    inkscape
    jetbrains.idea
    jetbrains.pycharm
    libreoffice-still
    magic-wormhole
    mattermost-desktop
    mutter
    ncdu
    nixfmt-rfc-style
    libreoffice-still
    nodejs_24
    obs-studio
    obsidian
    openjdk
    unstable.prismlauncher
    python3
    rclone
    ripgrep
    unstable.spotify
    unstable.texliveFull
    thunderbird
    tree
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
    extraSpecialArgs = { inherit configDir; };
  };

  home-manager.users."francisco" =
    { pkgs, configDir, ... }:
    {
      imports = with profiles.user; [
        alacritty
        direnv
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

      home.sessionVariables = {
        OZONE_PLATFORM = "wayland";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      };
    };
}
