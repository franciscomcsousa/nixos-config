{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... }@inputs:
	let
		inherit (inputs.nixpkgs) lib;
		inherit (inputs.home.nixosModules) home-manager;

    system = "x86_64-linux";
		user = "francisco";

    pkgs = let
      args = {
        inherit system;
        config.allowUnfree = true;
      };
    in
      import inputs.nixpkgs (args
        // {
          overlays = [
            (_final: _prev: {
              unstable = import inputs.nixpkgs-unstable args;
            })
          ];
        });

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
					++ (importRecursive ./modules);
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
