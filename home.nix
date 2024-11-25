{
  inputs,
  pkgs,
  nixvim,
  #pkgs-unstable,
  ...
}: 
{
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home = {
    packages = [
      pkgs.nodejs
      pkgs.ripgrep
      pkgs.xclip # WSL to Windows clipboard
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "0xProto" ]; })
      (pkgs.python311.withPackages (ps: with ps; [ pip ]))
      pkgs.fzf
      pkgs.fd
      pkgs.bat
      pkgs.oh-my-posh
      pkgs.eza
    ];

#    file = {
#        ".bashrc".source = ./dotfiles/bash/.bashrc;
#        "fzf-git.sh".source = ./dotfiles/bash/fzf-git.sh;
#        "jandedobbeleer.omp.json".source = ./dotfiles/bash/jandedobbeleer.omp.json;
#
#        };

    

    # This needs to actually be set to your username
    username = "mathipe";
    homeDirectory = "/home/mathipe";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
    
    file."nvim" = {
      source = ./dotfiles/nvim;
      target = ".config/nvim";
      recursive = true;
    };

    file.".bashrc".source = ./dotfiles/bash/.bashrc;
  };

  
  
}
