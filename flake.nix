{
  description = ''


    ██████╗ ███████╗██╗  ████████╗ █████╗  ██████╗██╗██████╗  ██████╗██╗   ██╗██╗████████╗
    ██╔══██╗██╔════╝██║  ╚══██╔══╝██╔══██╗██╔════╝██║██╔══██╗██╔════╝██║   ██║██║╚══██╔══╝
    ██║  ██║█████╗  ██║     ██║   ███████║██║     ██║██████╔╝██║     ██║   ██║██║   ██║
    ██║  ██║██╔══╝  ██║     ██║   ██╔══██║██║     ██║██╔══██╗██║     ██║   ██║██║   ██║
    ██████╔╝███████╗███████╗██║   ██║  ██║╚██████╗██║██║  ██║╚██████╗╚██████╔╝██║   ██║
    ╚═════╝ ╚══════╝╚══════╝╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝   ╚═╝

  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-git.url = "github:hyprwm/hyprland";
    hyprland-xdph-git.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprland-protocols-git.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    hyprland-nix = {
      url = "github:spikespaz/hyprland-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        hyprland.follows = "hyprland-git";
        hyprland-xdph.follows = "hyprland-xdph-git";
        hyprland-protocols.follows = "hyprland-protocols-git";
      };
    };

    flake-utils.url = "github:numtide/flake-utils";

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    hyprlock.url = "github:hyprwm/hyprlock";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

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

          "giridharan@giridharan-gm" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./hosts/hp_probook/users/giri/home.nix];
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {
              inherit inputs outputs;
            };
          };
        };
      };
    });
}
