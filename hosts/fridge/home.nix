{ pkgs, profiles, configDir, ... }:
let
requiredPackages = with pkgs;
[
	bat
	brave
	discord
	firefox
	fzf
	gcc
	jetbrains.idea-ultimate
	neofetch
	obs-studio
	obsidian
	openjdk
	openrgb
	python3
	rclone
	ripgrep
	spotify
	thunderbird	
	unzip
	vscode
	zip
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
			zsh
		];

		home = 
		{
			username = "francisco";
			homeDirectory = "/home/francisco";
			stateVersion = "24.05";
		};

		# Let Home Manager install and manage itself.
		programs.home-manager.enable = true;

		home.packages = requiredPackages;   
	};
}
