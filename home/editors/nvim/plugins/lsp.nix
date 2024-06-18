{...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          diagnostic = {
            "]d" = "goto_next";
            "[d" = "goto_prev";
          };

          lspBuf = {
            K = "hover";
            gD = "declaration";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
        };
      };
    };
  };
}
