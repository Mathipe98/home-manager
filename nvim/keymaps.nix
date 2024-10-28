{
  programs.nixvim = {
    # General keymaps
    keymaps = [
      { mode = "v"; key = "J"; action = ":m '>+1<CR>gv=gv"; }
      { mode = "v"; key = "K"; action = ":m '<-2<CR>gv=gv"; }

      { mode = "n"; key = "J"; action = "mzJ`z"; }
      { mode = "n"; key = "<C-d>"; action = "<C-d>zz"; }
      { mode = "n"; key = "<C-u>"; action = "<C-u>zz"; }
      { mode = "n"; key = "n"; action = "nzzzv"; }
      { mode = "n"; key = "N"; action = "Nzzzv"; }

      { mode = "x"; key = "<leader>p"; action = "\"_dP"; }

      { mode = "n"; key = "<leader>y"; action = "\"+y"; }
      { mode = "v"; key = "<leader>y"; action = "\"+y"; }
      { mode = "n"; key = "<leader>Y"; action = "\"+Y"; }

      { mode = "n"; key = "<leader>d"; action = "\"_d"; }
      { mode = "v"; key = "<leader>d"; action = "\"_d"; }

      { mode = "n"; key = "<C-k>"; action = "<cmd>cnext<CR>zz"; }
      { mode = "n"; key = "<C-j>"; action = "<cmd>cprev<CR>zz"; }
      { mode = "n"; key = "<leader>k"; action = "<cmd>lnext<CR>zz"; }
      { mode = "n"; key = "<leader>j"; action = "<cmd>lprev<CR>zz"; }

      # Navigating buffers
      { mode = "n"; key = "<A-,>"; action.__raw = "vim.cmd.bprevious"; }
      { mode = "n"; key = "<A-.>"; action.__raw = "vim.cmd.bnext"; }
      { mode = "n"; key = "<A-c>"; action.__raw = "vim.cmd.bd"; }
      { mode = "n"; key = "<leader>bq"; action = "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>"; }

      # Resizing splits
      { mode = "n"; key = "<A-a>"; action = "<C-w>5<"; }
      { mode = "n"; key = "<A-d>"; action = "<C-w>5>"; }
      { mode = "n"; key = "<A-s>"; action = "<C-w>+"; }
      { mode = "n"; key = "<A-w>"; action = "<C-w>-"; }

      # Clear highlights on search when pressing <Esc> in normal mode
      { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; }

      # Diagnostic keymaps
      { mode = "n"; key = "<leader>q"; action.__raw = "vim.diagnostic.setloclist"; options = { desc = "Open diagnostic [Q]uickfix list"; }; }

      # Exit terminal mode in the builtin terminal
      { mode = "t"; key = "<Esc><Esc>"; action = "<C-\\><C-n>"; options = { desc = "Exit terminal mode"; }; }

      # Keybinds to make split navigation easier
      { mode = "n"; key = "<C-h>"; action = "<C-w><C-h>"; options = { desc = "Move focus to the left window"; }; }
      { mode = "n"; key = "<C-l>"; action = "<C-w><C-l>"; options = { desc = "Move focus to the right window"; }; }
      { mode = "n"; key = "<C-j>"; action = "<C-w><C-j>"; options = { desc = "Move focus to the lower window"; }; }
      { mode = "n"; key = "<C-k>"; action = "<C-w><C-k>"; options = { desc = "Move focus to the upper window"; }; }

      # Neo-tree keybindings
      { mode = "n"; key = "<C-n>"; action = "<Cmd>Neotree toggle<CR>"; }
    ];

    extraConfigLua = ''
      vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
        callback = function()
          vim.highlight.on_yank()
        end,
      })
    '';
  };

  
}