{
  autoGroups = {
    highlight_yank = {
      __raw = "vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true })";
    };
    vim_enter = {};
    indentscope = {};
    restore_cursor = {};
  };

  autoCmd = [
    {
      group = "highlight_yank";
      event = ["TextYankPost"];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }
  ];
}