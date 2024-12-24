{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.containers.lidarr = {
    enable = lib.mkEnableOption "enable lidarr arion container";
  };

  config = lib.mkIf config.settings.containers.lidarr.enable {
    virtualisation.arion.projects.lidarr = {
      settings = {
        project.name = "lidarr";
        services.lidarr = {
          service.useHostStore = true;
          nixos.useSystemd = true;
          nixos.configuration =
            { lib, ... }:
            {
              boot.isContainer = true;
              boot.tmp.useTmpfs = true;
              networking.useDHCP = false;
              services.nscd.enable = false;
              system.nssModules = lib.mkForce [ ];

              services.lidarr.enable = true;
              services.lidarr.openFirewall = true;
              services.lidarr.dataDir = "/config";
              services.lidarr.user = "root";
            };
          service.ports = [ "8686:8686" ];
          service.volumes = [
            "/config/lidarr:/config"
            "/data:/data"
          ];
        };
      };
    };
  };
}
