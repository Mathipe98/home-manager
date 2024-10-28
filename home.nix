{
  inputs,
  pkgs,
  #pkgs-unstable,
  ...
}: 
{
  programs.home-manager.enable = true;  

  home = {
    packages = [
      pkgs.hello
      pkgs.nodejs
    ];

    

    # This needs to actually be set to your username
    username = "mathipe";
    homeDirectory = "/home/mathipe";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
  };
  
}
