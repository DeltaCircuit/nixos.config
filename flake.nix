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
    ...
  }@inputs: flake-parts.lib.mkFlake { inherit inputs; } {

  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland-nix.url = "github:spikespaz/hyprland-nix";
    flake-utils.url = "github:numtide/flake-utils";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    pre-commit-hooks.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-utils.follows = "flake-utils";
    };
  };
}