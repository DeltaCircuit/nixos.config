function reload_config()
  RELOAD = require("plenary.reload").reload_module
  RELOAD(os.getenv("MYVIMRC"))
  vim.cmd [[luafile $MYVIMRC]]
  print(vim.inspect("RELOADED!!!"))
end

vim.api.nvim_set_keymap('n','<leader>rc','<cmd>lua reload_config()<CR>', { silent = true, noremap = true, desc = "Reload Config"})
