{ pkgs, profiles, configDir, ... }:
let
requiredPackages = with pkgs;
[
	android-studio
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
	unstable.obsidian
	openjdk
	python311Packages.pip
	python3
	rclone
	spotify
	thunderbird
	tmux
	unzip
	vscode
	xournalpp
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
		];

		home = {
			username = "francisco";
			homeDirectory = "/home/francisco";
			stateVersion = "23.11";
		};

		# Let Home Manager install and manage itself.
		programs.home-manager.enable = true;

		home.packages = requiredPackages;   
	};
}
