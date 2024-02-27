{pkgs, ...}: let
  flavour = "mocha";
in {
  programs.starship.settings =
    {
      palette = "catppuccin_${flavour}";
      username = {
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        disabled = false;
      };
    }
    // builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "starship";
        rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
        sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
      }
      + /palettes/${flavour}.toml));
}
