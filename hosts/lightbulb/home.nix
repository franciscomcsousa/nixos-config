{ pkgs, profiles, configDir, ... }:
let
requiredPackages = with pkgs;
[
	bat
	exiftool
	fzf
	neofetch
	python3
	rclone
	ripgrep
	unzip
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
