{ pkgs, inputs, outputs, lib, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
    ./pipewire.nix
    ./fonts.nix
    ./programs
    ./services
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };


  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;
  };
}
