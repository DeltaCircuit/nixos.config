{...}: {
  imports = [
    ./python.nix
    ./nix.nix
    ./json.nix
  ];
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
      };
    };
  };
}
