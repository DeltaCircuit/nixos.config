{
  description = ''


    ██╗  ██╗ ██████╗ ███╗   ███╗███████╗██╗      █████╗ ██████╗ ██╗  ██╗
    ██║  ██║██╔═══██╗████╗ ████║██╔════╝██║     ██╔══██╗██╔══██╗╚██╗██╔╝
    ███████║██║   ██║██╔████╔██║█████╗  ██║     ███████║██████╔╝ ╚███╔╝
    ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  ██║     ██╔══██║██╔══██╗ ██╔██╗
    ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗███████╗██║  ██║██████╔╝██╔╝ ██╗
    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝

  '';

  outputs = {
    flake-parts,
    lanzaboote,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} ({self, ...}: let
      inherit (self) outputs;
    in {
      imports = [
        ./pre-commit-hooks.nix
      ];

      systems = ["x86_64-linux"];

      perSystem = {
        config,
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            alejandra
            nil
          ];

          name = "homelabx";
          meta.description = "default nix dev env";

          shellHook = ''
            ${config.pre-commit.installationScript}
          '';
        };

        formatter = pkgs.alejandra;
      };

      flake = {
        homeManagerModules = import ./modules/home-manager;
        nixosConfigurations = {
          precision = inputs.nixpkgs.lib.nixosSystem {
            modules = [./hosts/precision/configuration.nix];
            specialArgs = {
              inherit inputs outputs;
            };
          };

          localcloud = inputs.nixpkgs.lib.nixosSystem {
            modules = [./hosts/localcloud/configuration.nix];
            specialArgs = {
              inherit inputs outputs;
            };
          };
        };

        homeConfigurations = {
          "giri@precision" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./hosts/precision/users/giri/home.nix];
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {
              inherit inputs outputs;
            };
          };

          "localadmin@localcloud" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./hosts/localcloud/users/localadmin/home.nix];
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {
              inherit inputs outputs;
            };
          };
        };
      };
    });

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland-nix.url = "github:spikespaz/hyprland-nix";
    flake-utils.url = "github:numtide/flake-utils";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    hyprlock.url = "github:hyprwm/hyprlock";
    lanzaboote.url = "github:nix-community/lanzaboote/v0.3.0";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    pre-commit-hooks.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-utils.follows = "flake-utils";
    };
    hyprlock.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
  };
}
