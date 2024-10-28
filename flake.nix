{
  description = "My Home Manager configuration";

  

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    
    # URL for specifying nightly version of nvim
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      lib = inputs.nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };
    in {
      homeConfigurations = {
        mathipe = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs pkgs-unstable; };
          modules = [ ./home.nix ];
        };
      };
    };
}