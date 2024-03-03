# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./users/localadmin
    ../../nixos
    ./firewall.nix
  ];

  modules.nixos = {
    shells = {
      zsh.enable = true;
    };

    programs = {
      nix-ld.enable = true;
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  networking = {
    hostName = "localcloud";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
  ];

  services.openssh.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
