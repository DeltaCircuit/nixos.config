{
  imports = [
    ./dunst.nix
    ./udiskie.nix
    ./blueman-applet.nix
    ./syncthing.nix
  ];

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = ["graphical-session-pre.targt"];
    };
  };
}
