_: {
  programs.nixvim = {
    plugins = {
      cmp-buffer.enable = true;
      cmp-emoji.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          sources = {
            __raw = ''
              cmp.config.sources({
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lua' },
                { name = 'buffer' },
                { name = 'vsnip' },
                { name = 'calc' },
              },
              {
                { name = 'buffer' }
              })
            '';
          };

          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })";
            "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          };
        };
      };
    };
  };
}
