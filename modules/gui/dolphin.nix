
{
  pkgs,
  lib,
  ...
}: {
  imports = [
    # ./ssh.nix
  ];

  # Add packages
  home.packages = lib.mkMerge [
    (with pkgs; [
        kdePackages.qtwayland
        kdePackages.qtsvg
        kdePackages.dolphin
    ])
  ];
}
