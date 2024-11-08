{
  lib,
  pkgs,
  config,
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      #inputs.nur.hmModules.nur
      #inputs.impermanence.nixosModules.home-manager.impermanence
      #./programs
      #./scripts.nix

      ./browsers/firefox.nix

      ./editors/nvim
      ./editors/vscode
      ./editors/helix

      #./multiplexers/tmux.nix
      #./multiplexers/zellij

      ./shells

      ./terminals

      #./security/sops.nix
      ./programs

      ./services

      ./wms

      ./devtools/lsp.nix

      ./installer.nix
    ]
    ++ builtins.attrValues outputs.homeManagerModules;

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
  };

  home.sessionVariables.EDITOR = config.my.settings.default.editor;

  home.packages = [pkgs.nil];

  nixpkgs = {
    #overlays =
    #  builtins.attrValues outputs.overlays
    #  ++ [
    #    inputs.nixneovimplugins.overlays.default
    #    inputs.nur.overlay
    #    inputs.attic.overlays.default
    #    inputs.neovim-nightly-overlay.overlay
    #    inputs.nixgl.overlay
    #    inputs.codeium.overlays."x86_64-linux".default
    #  ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  #home.packages = [pkgs.nixgl.nixGLIntel];

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      substituters = [
        #  "https://majiy00-nix-binary-cache.fly.dev/prod"
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        #    "prod:fjP15qp9O3/x2WTb1LiQ2bhjxkBBip3uhjlDyqywz3I="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
      use-xdg-base-directories = true;
      # netrc-file = "$HOME/.config/nix/netrc";
    };
  };

  news = {
    display = "silent";
    json = lib.mkForce {};
    entries = lib.mkForce [];
  };
}
