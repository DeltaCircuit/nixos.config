{ config, lib, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ../../nixos
    ../../nixos/users/giri.nix
  ];

  networking = {
    networkmanager = {
      enable = true;
    };
    hostName = "precision";
  }; 

  boot = {
    initrd = {
      luks = {
        devices = {
          crypt = {
            device = "/dev/disks/by-uuid/599e2922-5fa6-47df-b655-f370b046695f";
            preLVM = true;
            allowDiscards = true;
          };
        };
      };
    };
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };


  

  time.timeZone = "Asia/Kolkata";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment = {
    defaultPackages = [ ];
    systemPackages = with pkgs; [
      acpi
      tlp
      git
      curl
      pipewire
      wireplumber
      mpd
    ];
  };
  
  system.stateVersion = "23.11";

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Hyprland
  programs = {
   hyprland = {
     enable = true;
   };
  };

 
  # ZSH
  programs.zsh.enable = true;

  hardware.opengl.extraPackages = with pkgs;dw [
    intel-media-driver
  ];
}

