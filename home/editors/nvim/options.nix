_: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };

    opts = {
      number = true;
      mouse = "a";
      ignorecase = true;
      smartcase = true;
      hlsearch = false;
      wrap = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      #clipboard = "unnamedplus";
      completeopt = ["menuone" "noselect" "noinsert"];
    };
  };
}
