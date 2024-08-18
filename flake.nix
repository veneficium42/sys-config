{
  description = "Veneficium's amazing fantastic mindblowingly stupid nixOS configuration! :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      pkgs = system: import nixpkgs {
        inherit system;
        overlays = [
          inputs.nix-vscode-extensions.overlays.default
        ];
        config = { allowUnfree = true; };
      };
    in {
      nixosConfigurations = {
        fedfer-main-laptop-nixos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { pkgs = (pkgs system); };
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

        veneficium-main-homelab-nixos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { pkgs = (pkgs system); };
          modules = [
            ./hosts/main-homelab/configuration.nix
          ];
        };
      };
    };
}
