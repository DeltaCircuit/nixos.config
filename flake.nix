{
    description = "NixOS Configuration"

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


            mkSystem = pkgs: system: hostname:
                pkgs.lib.nixosSystem {
                    system = system;
                    modules = [
                        {
                            networking = {
                                hostname = hostname;
                            };
                        }
                        # ./modules/system/configuration.nix
                        (./. + "/hosts/${hostname}/hardware-configuration.nix")
                        home-manager.nixosModules.home-manager
                        {
                            home-manager = {
                                useUserPackages = true;
                                useGlobalPackages = true;
                                extraSpecialArgs = { inherit inputs;};
                                users.giri = (./. + "/hosts/${hostname}/user.nix");
                            };
                        }
                    ];
                    specialArgs = { inherit inputs;};
                };
        in
        {
            nixosConfigurations = {
                entecloud_precision = mkSystem inputs.nixpkgs ${system} "entecloud_precision";
            }
        }


}