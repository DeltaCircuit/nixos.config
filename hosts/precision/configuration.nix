{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
    ./hardware-configuration.nix
    ../../nixos
    ./users/giri
  ];

  modules.nixos = {
    shells = {
      zsh.enable = true;
    };

    services = {
      blueman.enable = true;
    };

    programs = {
      nix-ld.enable = true;
    };
  };

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
            device = "/dev/disk/by-uuid/10c73428-8bdf-4917-9b5e-220f4abac6d1";
            preLVM = true;
            allowDiscards = true;
          };
        };
      };
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    loader = {
      systemd-boot = {
        enable = lib.mkForce false;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  boot.supportedFilesystems = ["ntfs"];

  time.timeZone = "Asia/Kolkata";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment = {
    defaultPackages = [];
    systemPackages = with pkgs; [
      acpi
      tlp
      git
      curl
      pipewire
      wireplumber
      mpd
      qt6.qtwayland
      sbctl
      docker-compose
      wl-clipboard
      xdg-desktop-portal-hyprland
      libnotify
    ];
  };

  system.stateVersion = "23.11";

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.graphics.enable = true;

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];

  virtualisation = {
    docker = {
      enable = true;
    };
  };
  security.polkit.enable = true;
  programs.dconf.enable = true;
  programs.hyprland.enable = true;

  services = {
    udev = {
      # extraRules = builtins.readFile ./udev_rules;
      extraRules = ''
        ACTION=="add", SUBSYSTEMS=="usb", ENV{DBUS_SESSION_BUS_ADDRESS}="unix:path=/run/user/$UID/bus", RUN+="${pkgs.writeShellScriptBin "udev_on_bat" (builtins.readFile ./toshiba.sh)}", ATTRS{serial}=="6E007970D8A68583"
      '';
    };
  };

  systemd.services = {
    toshiba_ehdd_handler = {
      enable = true;
      after = ["dev-%i.device"];
      description = "Handle Toshiba HDD insert";
      unitConfig = {
      };
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "/home/giri/.config/entecloud/toshiba.sh %I";
      };
      wantedBy = [
        "multi-user.target"
      ];
    };
  };
}
