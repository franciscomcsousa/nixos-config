{ pkgs, profiles, configDir, ... }:
let
requiredPackages = with pkgs;
[
	android-studio
	arduino
	bat
	brave
	discord
	firefox
	flutter
	gcc
	gradle_7
	hello
	jetbrains.idea-ultimate
	neofetch
	obs-studio
	openjdk
	openrgb
	python3
	rclone
	ripgrep
	spotify
	thunderbird	
	unzip
	unixODBCDrivers.mariadb
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

		stylix.targets.tmux.enable = false;

		home.packages = requiredPackages;   
	};
}
