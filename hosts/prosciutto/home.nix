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
    imports =
    [
      profiles.neovim
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
