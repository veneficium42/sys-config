{ lib, ... }:
{
  imports = [
    ./jellyfin.nix
    ./qbittorrent.nix
    ./prowlarr.nix
    ./lidarr.nix
    ./wg-easy.nix
    ./homarr.nix
    ./minecraft_bedrock.nix
  ];

  settings.containers = {
    jellyfin.enable = lib.mkDefault false;
    qbittorrent.enable = lib.mkDefault false;
    lidarr.enable = lib.mkDefault false;
    prowlarr.enable = lib.mkDefault false;
    wg-easy.enable = lib.mkDefault false;
    homarr.enable = lib.mkDefault false;
    minecraft.enable = lib.mkDefault true;
  };

}
