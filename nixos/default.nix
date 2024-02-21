{ pkgs, inputs, outputs, lib, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
    ./pipewire.nix
    ./fonts.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };
}
