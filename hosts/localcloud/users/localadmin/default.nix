{pkgs, ...}: {
  home-manager.users.localadmin = import ./home.nix;
  users.users.localadmin = {
    shell = pkgs.zsh;
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
