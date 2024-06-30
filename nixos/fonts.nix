{
  config,
  lib,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono"];})
    fira-code
    fira-code-symbols
    fira
    font-awesome
    dejavu_fonts.full-ttf
    liberation_ttf
    noto-fonts
  ];
}
