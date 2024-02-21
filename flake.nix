{
  description = "nambolan's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-nix.url = "github:spikespaz/hyprland-nix";
    nix-colors.url = "github:misterio77/nix-colors";
    fu.url = "github:numtide/flake-utils";

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows="nixpkgs";
      inputs.flake-utils.follows = "fu";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = ["x86_64-linux"];
    imports = [
      ./pre-commit-hooks.nix
    ];
    forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
    pkgsFor = nixpkgs.legacyPackages;
   
  in {
    inherit lib;
    # nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    # overlays = import ./overlays {inherit inputs outputs;};
    # packages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});
    # devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs inputs;});



    nixosConfigurations = {
      precision = lib.nixosSystem {
        modules = [./hosts/precision/configuration.nix];
        specialArgs = {inherit inputs outputs;};
      };
    };

    homeConfigurations = {
      "giri@precision"= lib.homeManagerConfiguration {
        modules = [./hosts/precision/giri.nix];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
