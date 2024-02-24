{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.programs.nix-ld;
in {
  options.modules.nixos.programs.nix-ld = {
    enable = mkEnableOption "Enable nix-ld";
    extra-libraries = mkOption {
      type = types.listOf types.package;
      default = [];
    };
  };

  config = mkIf cfg.enable {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs;
        [
        ]
        ++ cfg.extra-libraries;
    };
  };
}
