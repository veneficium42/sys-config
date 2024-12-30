{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.containers.qbittorrent = {
    enable = lib.mkEnableOption "enable qbittorrent arion container";
  };

  config = lib.mkIf config.settings.containers.qbittorrent.enable {
    virtualisation.arion.projects.qbittorrent = {
      settings = {
        project.name = "qbittorrent";
        services.qbittorrent = {
          service.useHostStore = true;
          service.image = "linuxserver/qbittorrent:latest";
          service.ports = [
            "8080:8080"
            "6881:6881"
            "6881:6881/udp"
          ];
          service.volumes = [
            "/config/qbittorrent:/config"
            "/data/torrents:/torrents"
          ];
          service.environment = {
            WEBUI_PORT = 8080;
            TORRENTING_PORT = 6881;
          };
        };
      };
    };
  };
}
