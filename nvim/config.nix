{
  programs.nixvim = {
    diagnostics = {
      severity_sort = true;
      update_in_insert = true;
      virtual_text = { prefix = "" };
      signs = {
        text = {
          [severity.ERROR] = "󰅙";
          [severity.WARN] = "";
          [severity.INFO] = "󰋼";
          [severity.HINT] = "󰌵";
        };
      };
      underline = true;
      float = { border = "single" };
    };

    lsp = {
      inlayHints = true;
    }
  }
}