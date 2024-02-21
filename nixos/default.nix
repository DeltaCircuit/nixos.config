{ pkgs, inputs, outputs, lib, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
    ./fonts.nix
    ./shells
    ./services
    ./wms
  ];
  

  home-manager.extraSpecialArgs = { inherit inputs outputs; };


  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;
  };
}
