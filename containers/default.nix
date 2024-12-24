{ lib, ... }:
{
  imports = [
    ./jellyfin.nix
    ./qbittorrent.nix
    ./lidarr.nix
  ];

  settings.containers = {
    jellyfin.enable = lib.mkDefault false;
    qbittorrent.enable = lib.mkDefault false;
    lidarr.enable = lib.mkDefault false;
  };

}
