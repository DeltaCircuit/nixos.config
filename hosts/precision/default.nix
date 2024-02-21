{ config, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./user_giri.nix
  ];
}
