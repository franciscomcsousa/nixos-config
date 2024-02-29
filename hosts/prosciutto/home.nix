{ pkgs, profiles, configDir, ... }:
let
requiredPackages = with pkgs;
[
	brave
	discord
	firefox
	hello
	jetbrains.idea-ultimate
	neofetch
	openjdk
	python311Packages.pip
	python3
	spotify
	thunderbird
	tmux
	unzip
	vscode
	xournalpp
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
      neovim
			git
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
