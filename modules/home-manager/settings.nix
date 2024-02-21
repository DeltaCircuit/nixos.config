{ lib, ... }:

let
  inherit (lib) types mkOption;

in {
  options.my.settings = {
    default = {
      shell = mkOption {
        type = types.nullOr (types.enum ["zsh"]);
        description = "Default shell to use";
        default = "zsh";
      };

      terminal = mkOption {
        type = types.nullOr (types.enum ["alacritty"]);
        description = "Default terminal";
        default = "alacritty";
      };

      browser = mkOption {
        type = types.nullOr (types.enum ["firefox"]);
        description = "Default browser";
        default = "firefox";
      };

      editor = mkOption {
        type = types.nullOr (types.enum ["code"]);
        description = "Default editor";
        default = "code";
      };
    };

    host = mkOption {
      type = types.str;
      default = "";
      description = ''
        Name of the host
      '';
    };
  };
}