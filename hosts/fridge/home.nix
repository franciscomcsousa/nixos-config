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
	python3
	spotify
	thunderbird	
	tmux
	unzip
	unixODBCDrivers.mariadb
	vscode
	zip
];
in
{
	home-manager = 
	{
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit configDir;
    };
  };
	
	home-manager.users."francisco" = { pkgs, configDir,	...}: 
	{
    imports = with profiles.user;
    [
		git
		gtk
		kitty
    	neovim
    ];
		home = 
		{
			username = "francisco";
			homeDirectory = "/home/francisco";
			stateVersion = "23.11";
		};

  	# Let Home Manager install and manage itself.
  	programs.home-manager.enable = true;

		home.packages = requiredPackages;   
	};
}
