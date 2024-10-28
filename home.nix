{
  inputs,
  pkgs,
  #pkgs-unstable,
  ...
}: 
{
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home = {
    packages = [
      pkgs.hello
      pkgs.nodejs
      pkgs.ripgrep
      pkgs.xclip # WSL to Windows clipboard
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "0xProto" ]; })
      (pkgs.python311.withPackages (ps: with ps; [ pip ]))
    ];

    

    # This needs to actually be set to your username
    username = "mathipe";
    homeDirectory = "/home/mathipe";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
  };
  
}
