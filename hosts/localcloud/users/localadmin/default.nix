{pkgs, ...}: {
  home-manager.users.localadmin = import ./home.nix;
  users.users.localadmin = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = [
      "wheel"
      "input"
    ];
    createHome = true;
    packages = with pkgs; [
      home-manager
    ];
  };
}
