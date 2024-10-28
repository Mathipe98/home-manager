{ pkgs, inputs, ... }: {
  imports = [
    # NOTE: The first thing you will want to do is uncommented on of the three imports below
    # depending on which module you chose to use to install Nixvim.
    #
    # Uncomment if you are using the home-manager module
    inputs.nixvim.homeManagerModules.nixvim
    # Uncomment if you are using the nixos module
    #inputs.nixvim.nixosModules.nixvim
    # Uncomment if you are using the nix-darwin module
    #inputs.nixvim.nixDarwinModules.nixvim

    # Plugins
    # ./plugins/gitsigns.nix
    # ./plugins/which-key.nix
    # ./plugins/telescope.nix
    # ./plugins/conform.nix
    # ./plugins/lsp.nix
    # ./plugins/nvim-cmp.nix
    # ./plugins/mini.nix
    # ./plugins/treesitter.nix

    # NOTE: Add/Configure additional plugins for Kickstart.nixvim
    #
    #  Here are some example plugins that I've included in the Kickstart repository.
    #  Uncomment any of the lines below to enable them (you will need to restart nvim).
    #
    # ./plugins/kickstart/plugins/debug.nix
    # ./plugins/kickstart/plugins/indent-blankline.nix
    # ./plugins/kickstart/plugins/lint.nix
    # ./plugins/kickstart/plugins/autopairs.nix
    # ./plugins/kickstart/plugins/neo-tree.nix
    #
    # NOTE: Configure your own plugins `see https://nix-community.github.io/nixvim/`
    # Add your plugins to ./plugins/custom/plugins and import them below
  ];

  /*
  =====================================================================
  ==================== READ THIS BEFORE CONTINUING ====================
  =====================================================================
  ========                                    .-----.          ========
  ========         .----------------------.   | === |          ========
  ========         |.-""""""""""""""""""-.|   |-----|          ========
  ========         ||                    ||   | === |          ========
  ========         ||  KICKSTART.NIXVIM  ||   |-----|          ========
  ========         ||                    ||   | === |          ========
  ========         ||                    ||   |-----|          ========
  ========         ||:Tutor              ||   |:::::|          ========
  ========         |'-..................-'|   |____o|          ========
  ========         `"")----------------(""`   ___________      ========
  ========        /::::::::::|  |::::::::::\  \ no mouse \     ========
  ========       /:::========|  |==hjkl==:::\  \ required \    ========
  ========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
  ========                                                     ========
  =====================================================================
  =====================================================================

  What is Kickstart.nixvim?

    Kickstart.nixvim is a starting point for your own configuration.
      The goal is that you can read every line of code, top-to-bottom, understand
      what your configuration is doing, and modify it to suit your needs.

      Once you've done that, you can start exploring, configuring and tinkering to
      make Neovim your own!

      If you don't know anything about Nixvim, Nix or Lua, I recommend taking some time to read through.
        - https://nix-community.github.io/nixvim/
        - https://learnxinyminutes.com/docs/nix/
        - https://learnxinyminutes.com/docs/lua/

  Kickstart.nixvim Guide:

    TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

      If you don't know what this means, type the following:
        - <escape key>
        - :
        - Tutor
        - <enter key>

      (If you already know the Neovim basics, you can skip this step.)

    Once you've completed that, you can continue working through **AND READING** the rest
    of the nixvim.nix.

    Next, run AND READ `:help`.
      This will open up a help window with some basic information
      about reading, navigating and searching the builtin help documentation.

      This should be the first place you go to look when you're stuck or confused
      with something. It's one of my favorite Neovim features.

      MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
      which is very useful when you're not exactly sure of what you're looking for.

    I have left several `:help X` comments throughout the nixvim.nix and the plugin .nix files
      These are hints about where to find more information about the relevant settings,
      plugins or Neovim features used in Kickstart.nixvim.

     NOTE: Look for lines like this

      Throughout the file. These are for you, the reader, to help you understand what is happening.
      Feel free to delete them once you know what you're doing, but they should serve as a guide
      for when you are first encountering a few different constructs in your Nixvim Neovim config.

  If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

  I hope you enjoy your Neovim journey,
  - JMartJonesy

  P.S. You can delete this when you're done too. It's your config now! :)
  */
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
