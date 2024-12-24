{ lib, ... }:
{
  imports = [
    ./jellyfin.nix
    ./qbittorrent.nix
  ];

  settings.containers = {
    jellyfin.enable = lib.mkDefault false;
    qbittorrent.enable = lib.mkDefault false;
  };

}
