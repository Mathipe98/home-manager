{...}: {
  home = {
    username = "mathipe";
    homeDirectory = "/home/mathipe";
    stateVersion = "24.05";

    sessionVariables = {
      # Set default applications
      SHELL = "$HOME/.nix-profile/bin/bash";
      #VISUAL = "vim";
      #EDITOR = "vim";
      BROWSER = "vivaldi";
      PAGER = "less";
      # Python config
      PYTHONDONTWRITEBYTECODE = "true";
      PIP_REQUIRE_VIRTUALENV = "true";
      POETRY_VIRTUALENVS_IN_PROJECT = "true";
      # SSH Agent
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent";
    };

    file."nvim" = {
      source = ../dotfiles/nvim;
      target = ".config/nvim";
      recursive = true;
    };

    file = {
      ".bashrc".source = ../dotfiles/bash/.bashrc;
      "fzf-git.sh".source = ../dotfiles/bash/fzf-git.sh;
      "jandedobbeleer.omp.json".source = ../dotfiles/bash/jandedobbeleer.omp.json;
    };

  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.home-manager.enable = true;

  # Ease usage on non-NixOS installations
  targets.genericLinux.enable = true;
  }
