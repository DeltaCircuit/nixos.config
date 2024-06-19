{
  pkgs,
  config,
  ...
}: {
  programs.nixvim = {
    plugins = {
      lsp.servers.jsonls.enable = true;
      confirm-nvim = {
        formattersByFt = {
          json = ["prettier"];
        };

        formatters = {
          prettier = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
          };
        };
      };

      treesitter = {
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          json
        ];
      };
    };
  };
}
