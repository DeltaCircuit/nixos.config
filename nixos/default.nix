{ pkgs, inputs, outputs, lib, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./conf.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };
}
