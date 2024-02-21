{ config, lib, ...}:

{
  programs.alacritty.settings = {

    selection = {
      save_to_clipboard = true;
    };

    shell.program = "zsh";

    mouse = {
      bindings = [
        {
          mouse = "Right";
          action = "Paste";
        }
      ];
    };


    colors = {

      primary = {
        background = "#${config.colorscheme.colors.base00}";
        foreground = "#${config.colorscheme.colors.base04}";
        dim_foreground = "#a5abb6";
      };

      cursor = {
        text = "#${config.colorscheme.colors.base00}";
        cursor = "#${config.colorscheme.colors.base04}";
      };

      vi_mode_cursor = {
        text = "#${config.colorscheme.colors.base00}";
        cursor = "#${config.colorscheme.colors.base04}";
      };

      selection = {
        text = "CellForeground";
        background = "#${config.colorscheme.colors.base03}";
      };

      search = {
        matches = {
          foreground = "CellBackground";
          background = "#${config.colorscheme.colors.base0C}";
        };

        # bar = {
        #   background = "#${config.colorscheme.colors.base02}";
        #   foreground = "#${config.colorscheme.colors.base04}";
        # };
      };

      normal = {
        black = "#${config.colorscheme.colors.base01}";
        red = "#${config.colorscheme.colors.base08}";
        green = "#${config.colorscheme.colors.base0B}";
        yellow = "#${config.colorscheme.colors.base0A}";
        blue = "#${config.colorscheme.colors.base0D}";
        magenta = "#${config.colorscheme.colors.base0E}";
        cyan = "#${config.colorscheme.colors.base0C}";
        white = "#${config.colorscheme.colors.base05}";
      };

      bright = {
        black = "#${config.colorscheme.colors.base03}";
        red = "#${config.colorscheme.colors.base08}";
        green = "#${config.colorscheme.colors.base0B}";
        yellow = "#${config.colorscheme.colors.base0A}";
        blue = "#${config.colorscheme.colors.base0D}";
        magenta = "#${config.colorscheme.colors.base0E}";
        cyan = "#${config.colorscheme.colors.base07}";
        white = "#${config.colorscheme.colors.base06}";
      };

      dim = {
        black = "#373e4d";
        red = "#94545d";
        green = "#809575";
        yellow = "#b29e75";
        blue = "#68809a";
        magenta = "#8c738c";
        cyan = "#6d96a5";
        white = "#aeb3bb";
      };
    };

  };
}