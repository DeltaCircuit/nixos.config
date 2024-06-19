{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins = {
      dap.extensions.dap-python.enable = true;
      lsp.servers.pyright.enable = true;

      conform-nvim = {
        formattersByFt = {
          py = ["black"];
        };

        formatters = {
          black = {
            command = "${pkgs.black}/bin/black";
          };
        };
      };

      treesitter = {
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          ninja
          python
          rst
        ];
      };
    };
  };
}
