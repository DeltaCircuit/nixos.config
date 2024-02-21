# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };


  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

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



  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

  # LUKS
  boot.initrd.luks.devices = {
    crypt = {
      device = "/dev/nvme1n1p2";
      preLVM = true;
      allowDiscards = true;
    };
  };

  # Giri's User
  users.users.giri = {
    isNormalUser = true;
    description = "Account of Giri";
    extraGroups = [ "wheel" "networkmanager" "audio" "video"];
    home = "/home/giri";
    createHome = true;
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Nix Configurations  
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  # Hyprland
  programs = {
   hyprland = {
     enable = true;
   };
  };

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    fira-code-nerdfont
  ];
  
  # ZSH
  programs.zsh.enable = true;

  # MPD
  services.mpd.enable = true;
  services.mpd.user = "giri";
  services.mpd.extraConfig = ''
    audio_output {
      type "pipewire"
      name "pipewire output"
    }
  '';

  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}

