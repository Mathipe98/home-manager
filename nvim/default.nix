{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    colorschemes.dracula.enable = true;
    plugins.web-devicons.enable = true;
    globals.mapleader = " ";
  };

  imports = [
    ./autocmds.nix
    ./plugins/treesitter.nix
    ./plugins/telescope.nix
    ./plugins/neo-tree.nix

  ];


  #diagnostics = { virtual_lines.only_current_line = true; };

} 
