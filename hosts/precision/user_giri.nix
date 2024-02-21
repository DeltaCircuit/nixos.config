{ lib, config, pkgs, ...}:

{
  users.users.giri = {
    isNormalUser = true;
    initialPassword = "nixos";
    description = "giri";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "input" "audio" "video" "networkmanager" ];
    home = "/home/giri";
    createHome = true;
  };
}
    
