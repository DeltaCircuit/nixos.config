{ config, lib, inputs, ...}:

{
  imports = [
    ../../modules/default.nix 
  ];

  config.modules = {
    zsh.enable = true;
    hyprland.enable = false;
  };
}
