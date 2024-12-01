{
  description = "Veneficium's amazing fantastic mindblowingly stupid nixOS configuration! :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    microvm.url = "github:astro/microvm.nix";
    microvm.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niri.url = "github:sodiboo/niri-flake";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      microvm,
      home-manager,
      stylix,
      niri,
      nix-vscode-extensions,
      ...
    }:
    let
      pkgs =
        extraOverlays: system:
        import nixpkgs {
          inherit system;
          overlays = extraOverlays;
          config = {
            allowUnfree = true;
          };
        };
    in
    {
      nixosConfigurations = {
        fedfer-main-laptop-nixos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            pkgs = (
              pkgs [
                nix-vscode-extensions.overlays.default
                niri.overlays.niri
                (import ./overlays/valent.nix)
              ] system
            );
          };

          modules = [
            ./hosts/main-laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.fedfer = import ./hosts/main-laptop/home.nix;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
            }
            stylix.nixosModules.stylix
            niri.nixosModules.niri
          ];
        };

        veneficium-main-homelab-nixos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            pkgs = (pkgs [ ] system);
            inherit self;
          };
          modules = [
            ./hosts/main-homelab/configuration.nix
            microvm.nixosModules.host
          ];
        };

        veneficium-microvm-vaultwarden = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            pkgs = (pkgs [ ] system);
          };
          modules = [
            microvm.nixosModules.microvm
            {
              networking.hostName = "veneficium-microvm-vaultwarden";
              microvm.hypervisor = "firecracker";
            }
          ];
        };
      };
      formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
