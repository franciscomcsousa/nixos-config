{
  pkgs,
  profiles,
  configDir,
  ...
}:
let
  requiredPackages = with pkgs; [
    audacity
    bat
    bear
    brave
    clang-tools
    discord
    evince
    exiftool
    fastfetch
    firefox
    fzf
    gcc
    gdb
    gimp
    go
    gnumake
    handbrake
    htop
    inkscape
    libreoffice-still
    lutris
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    magic-wormhole
    mattermost-desktop
    nixfmt-rfc-style
    jre8
    ncdu
    nodejs_24
    obs-studio
    obsidian
    unstable.prismlauncher
    python3
    rclone
    ripgrep
    unstable.spotify
    scrcpy
    unstable.texliveFull
    thunderbird
    tree
    unzip
    vagrant
    vscode
    waydroid
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
