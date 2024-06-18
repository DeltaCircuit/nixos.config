{...}: {
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>";
        key = "<leader>fa";
        options = {
          desc = "Find all files";
        };
        mode = ["n"];
      }
    ];

    plugins.telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
      extensions.media-files.enable = true;

      settings = {
        defaults = {
          sorting_strategy = "ascending";
          layout_config = {
            prompt_position = "top";
          };
        };
      };

      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Find files";
          };
        };

        "<leader>fz" = {
          action = "current_buffer_fuzzy_find";
          options = {
            desc = "Find in current buffer";
          };
        };

        "<leader>fr" = {
          action = "oldfiles";
          options = {
            desc = "Recent files";
          };
        };

        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Grep";
          };
        };

        "<leader>fw" = {
          action = "grep_string";
          options = {
            desc = "Search word under cursor";
          };
        };

        "<leader>fb" = {
          action = "buffers";
          options = {
            desc = "Find buffer";
          };
        };

        "<leader>fc" = {
          action = "command_history";
          options = {
            desc = "Search in command history";
          };
        };
      };
    };
  };
}
