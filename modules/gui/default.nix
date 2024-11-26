

{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./dolphin.nix
    ./hyprland.nix
    ./nixgl.nix
    ./hyprland.nix
    ./mpv.nix
  ];

  # Add packages
  home.packages = lib.mkMerge [
    (with pkgs; [
        vivaldi
    ])
  ];
}
