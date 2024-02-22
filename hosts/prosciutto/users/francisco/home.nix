{ pkgs, profiles, configDir, ... }:
let
requiredPackages = with pkgs;
[
    hello
    brave
    discord
    firefox
    jetbrains-toolbox
    neofetch
    openjdk
    spotify
    thunderbird
    tmux
    vscode
    xournalpp
];
in
{
	home-manager = 
	{
    useGlobalPkgs = true;
    useUserPackages = true;
  };
	
	home-manager.users."francisco" = { pkgs, configDir,	...}: 
	{
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
