{

  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... }@inputs:
	let
		inherit (inputs.nixpkgs) lib;
		inherit (inputs.home.nixosModules) home-manager;

    system = "x86_64-linux";
		user = "francisco";
    #pkgs = nixpkgs.legacyPackages.${system};
    pkgs = import inputs.nixpkgs {
      inherit system;
			config = {
	  		allowUnfree = true;
			};
    };

		importRecursive = dir: let
      entries = lib.filesystem.listFilesRecursive dir;
    in
      if (builtins.pathExists dir)
      then
        builtins.map
        (entry: (import entry))
        (builtins.filter (entry: lib.hasSuffix ".nix" entry) entries)
      else [];

		mkProfiles = dir: let
      mkLevel = entry: type:
        if (lib.hasSuffix ".nix" entry && type == "regular")
        then (import "${dir}/${entry}")
        else if type == "directory"
        then mkProfiles "${dir}/${entry}"
        else {};

      doMagic = key: value:
        lib.attrsets.nameValuePair (lib.removeSuffix ".nix" key)
        (mkLevel key value);
    in
      lib.attrsets.mapAttrs' doMagic (builtins.readDir dir);

		_modules = importRecursive ./modules;

		_profiles = mkProfiles ./profiles;

    mkHost = {
      name,
      dir,
    }:
		lib.nixosSystem {
				inherit system;
				inherit pkgs;
				specialArgs = {
						inherit user;
						inherit inputs;
						profiles = mkProfiles ./profiles;
						configDir = ./config;
        };
				modules =
					[
						{networking.hostName = name;}
						home-manager
					]
					++ (importRecursive dir)
					++ _modules;
		};
		mkHosts = dir: let
      filterHosts = hosts: lib.attrsets.filterAttrs (key: value: value == "directory") hosts;
    in
      lib.attrsets.mapAttrs
      (entry: type:
        mkHost {
          name = entry;
          dir = "${dir}/${entry}";
        })
      (filterHosts (builtins.readDir dir));
  in
    {
			nixosConfigurations = mkHosts ./hosts;
			formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    };
}
