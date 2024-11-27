{
  description = "My Home Manager configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; #"github:nixos/nixpkgs/nixos-23.11";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    
    # URL for specifying nightly version of nvim
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixGL = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nixvim, nixGL, hyprpanel, ... }@inputs:
    let
      lib = inputs.nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { 
            inherit system; 
            config = {
              allowUnfree = true;
              allowUnfreePredicate = _: true;
            };
            overlays = [
              hyprpanel.overlay
            ];
          };
    in {
      homeConfigurations = {
        mathipe = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit nixGL; inherit inputs; inherit nixvim; };
          modules = [
            #./home.nix
            ./modules/home.nix
            ./modules/terminal
            ./modules/gui
          ];
        };
      };
    };
}
