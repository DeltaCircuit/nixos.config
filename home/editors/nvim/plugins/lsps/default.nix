{...}: {
  imports = [
    ./python.nix
  ];
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
      };
    };
  };
}
