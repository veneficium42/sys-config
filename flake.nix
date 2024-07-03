{
  #need to put something funny in here
  #this one is so boring :/
  description = "fedfer nix flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: let

  overlays = [
    # Nix VSCode Extensions Overlay
    inputs.nix-vscode-extensions.overlays.default
];

  pkgs = system: import nixpkgs {
    inherit system overlays;
    config = {allowUnfree = true;};
  };

  in {

    nixosConfigurations = {

      fedfer-main-laptop-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit pkgs; };
        modules = [ 
          ./hosts/main-laptop/configuration.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = false;
            home-manager.users.fedfer = import ./hosts/main-laptop/home.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };

    };
  };
}
