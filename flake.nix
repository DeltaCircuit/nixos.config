{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, ...}@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;

      in {
        nixosModules = import ./modules/nixos;
        homeManagerModules = import ./modules/home-manager;
       
        nixosConfigurations = {
          precision = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
          ];
        };

        homeConfigurations = {
          giri = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
 }
