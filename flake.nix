{
  description = "Veneficium's amazing fantastic mindblowingly stupid nixOS configuration! :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    arion.url = "github:hercules-ci/arion";
    arion.inputs.nixpkgs.follows = "nixpkgs";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      arion,
      stylix,
      niri,
      nix-vscode-extensions,
      treefmt-nix,
      helix,
      ...
    }:
    {
      nixosConfigurations = {
        fedfer-main-laptop-nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            {
              nixpkgs.overlays = [
                nix-vscode-extensions.overlays.default
                helix.overlays.default
                niri.overlays.niri
              ];
            }
            ./hosts/main-laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.fedfer = import ./hosts/main-laptop/home.nix;
              home-manager.backupFileExtension = "backup";
            }
            stylix.nixosModules.stylix
            niri.nixosModules.niri
          ];
        };

        veneficium-main-homelab-nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            arion.nixosModules.arion
            ./hosts/main-homelab/configuration.nix
          ];
        };
      };

      formatter.x86_64-linux =
        (treefmt-nix.lib.evalModule nixpkgs.legacyPackages."x86_64-linux" ./treefmt.nix)
        .config.build.wrapper;
    };
}
