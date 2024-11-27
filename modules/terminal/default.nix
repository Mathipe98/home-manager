{
  pkgs,
  lib,
  ...
}: {
  imports = [
    # ./fish.nix
    # ./git.nix
    # ./kubernetes.nix
    # ./mise.nix
    # ./ssh.nix
  ];

  # Add packages
  home.packages = lib.mkMerge [
    (with pkgs; [
      nodejs
      ripgrep
      xclip # WSL to Windows clipboard
      (python311.withPackages (ps: with ps; [ pip ]))
      fzf
      fd
      bat
      oh-my-posh
      eza
      gh
      (nerdfonts.override {
        fonts = [
          "0xProto"
          "Hack"
          "FiraCode"
          "FiraMono"
          "CascadiaCode"
          "Cousine"
          "DroidSansMono"
          "JetBrainsMono"
          "SourceCodePro"
        ];
      })
    ])
  ];

  # Allow fontconfig to discover fonts and configurations installed through home.packages
  fonts.fontconfig.enable = true;

  programs.nix-index.enable = true;
  }
