{config, ...}: {
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        indent = true;

        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          vim
          vimdoc
          bash
          diff
          json
          toml
        ];
      };
    };
  };
}
