{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ../../../../home
  ];

  config = {
    modules = {
      shells.zsh.enable = true;
      programs.fzf.enable = true;
      programs.direnv.enable = true;
      programs.starship.enable = true;
      terminals.kitty.enable = true;
      editors.helix.enable = true;
    };

    my.settings = {
      host = "experion";
      default = {
        shell = "${pkgs.zsh}/bin/zsh";
        browser = "firefox";
        terminal = "alacritty";
      };
    };

    home = {
      username = "giridharan";
      homeDirectory = "/home/giridharan";
      stateVersion = "23.11";

      file = {
        ".config/sway/config".source = ./programs/sway/config;
        ".config/i3/config".source = ./wms/i3/config;
      };

      packages = with pkgs; [
        terraform-ls
        nodePackages.typescript-language-server
      ];
    };

    programs.zsh.history.path = "$HOME/.histfile";
  };
}
