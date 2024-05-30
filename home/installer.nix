{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  resolvePackages = pkgNames: map (pkgName: pkgs.${pkgName}) pkgNames;
in {
  options.modules.installer.packages = mkOption {
    type = types.listOf types.str;
    description = "List of extra packages to be instlled";
    example = ["htop" "jq"];
  };

  config = mkIf (config.modules.installer.packages != null) {
    home.packages = resolvePackages config.modules.installer.packages;
  };
}
