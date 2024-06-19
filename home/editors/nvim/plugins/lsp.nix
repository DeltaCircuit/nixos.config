{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    statix
  ];
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 500;
        };
      };

      lint = {
        enable = true;
      };

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
