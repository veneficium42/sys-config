{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.containers.qbittorent = {
    enable = lib.mkEnableOption "enable qbittorent arion container";
  };

  config = lib.mkIf config.settings.containers.qbittorent.enable {
    virtualisation.arion.projects.qbittorent = {
      settings = {
        project.name = "qbittorent";
        services.qbittorent = {
          service.useHostStore = true;
          service.image = "linuxserver/qbittorrent:latest";
          service.ports = [
            "8080:8080"
            "6881:6881"
            "6881:6881/udp"
          ];
          service.volumes = [
            "/config/qbittorent:/config"
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
