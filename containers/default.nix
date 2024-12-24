{ lib, ... }:
{
  imports = [
    "./jellyfin.nix"
    "./qbittorent.nix"
  ];

  settings.containers = {
    jellyfin.enable = lib.mkDefault false;
    qbittorent.enable = lib.mkDefault false;
  };

}
