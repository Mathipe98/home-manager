{
  programs.nixvim = {
    # Highlight, edit, and navigate code
    # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
    plugins.treesitter = {
      enable = true;

      # TODO: Don't think I need this as nixGrammars is true which should auto install these???
      settings = {
        ensureInstalled = [
          "arduino"
          "bash"
          "c"
          "c_sharp"
          "cpp"
          "css"
          "dockerfile"
          "go"
          "gomod"
          "gosum"
          "html"
          "hyprlang"
          "ini"
          "json"
          "jsonc"
          "javascript"
          "lua"
          "make"
          "markdown"
          "markdown_inline"
          "python"
          "typescript"
          "tsx"
          "rust"
          "tmux"
          "toml"
          "vim"
          "vimdoc"
          "xml"
          "yaml"
        ];
        auto_install = true;
        ignore_install = [];

        highlight = {
          enable = true;
          disable.__raw = ''
            function(lang, buf)
              local max_filesize = 100 * 1024 -- 100 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                return true
              end
            end
          '';

          # Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          additional_vim_regex_highlighting = true;
        };

        indent = {
          enable = true;
          disable = [
            "ruby"
          ];
        };
        modules = {};

        # There are additional nvim-treesitter modules that you can use to interact
        # with nvim-treesitter. You should go explore a few and see what interests you:
        #
        #    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        #    - Show your current context: https://nix-community.github.io/nixvim/plugins/treesitter-context/index.html
        #    - Treesitter + textobjects: https://nix-community.github.io/nixvim/plugins/treesitter-textobjects/index.html
      };
    };
  };
}