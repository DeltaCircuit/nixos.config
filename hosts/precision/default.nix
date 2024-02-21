{ config, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./user_giri.nix
    ../../modules/default.nix
  ];

  config.modules = {
    zsh.enable = true;
  };
}
