{ pkgs, profiles, configDir, ... }:
let
requiredPackages = with pkgs;
[
	bat
	discord
	exiftool
	firefox
	fzf
	gcc
	go
	jetbrains.idea-ultimate
	neofetch
	nodejs_22
	obs-studio
	obsidian
	openjdk
	python3
	rclone
	ripgrep
	spotify
	thunderbird
	unzip
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
	
	home-manager.users."francisco" = { pkgs, configDir,	...}: {
		imports = with profiles.user;
		[
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
