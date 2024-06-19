{pkgs, ...}: {
  imports = [
    ../../../../home
  ];

  config = {
    modules = {
      installer.packages = [];
      programs = {
        fzf.enable = true;
        direnv.enable = true;
        yazi.enable = true;
      };

      services = {
        blueman-applet.enable = true;
        syncthing.enable = true;
      };

      shells = {
        zsh.enable = true;
      };

      terminals = {
        kitty.enable = true;
      };
    };

    my.settings = {
      host = "localcloud";
      default = {
        shell = "${pkgs.zsh}/bin/zsh";
        browser = "firefox";
        terminal = "kitty";
      };
    };

    home = {
      username = "localadmin";
      homeDirectory = "/home/localadmin";
      stateVersion = "23.11";
    };
  };
}
