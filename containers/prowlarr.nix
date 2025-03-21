{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.containers.prowlarr = {
    enable = lib.mkEnableOption "enable prowlarr arion container";
  };

  config = lib.mkIf config.settings.containers.prowlarr.enable {
    virtualisation.arion.projects.prowlarr = {
      settings = {
        project.name = "prowlarr";
        services.prowlarr = {
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

              systemd.oomd.enable = false;

              services.prowlarr.enable = true;
              services.prowlarr.openFirewall = true;
            };
          service.ports = [ "9696:9696" ];
          service.volumes = [
            "/config/prowlarr:/config"
            "/data:/data"
          ];
        };
      };
    };
  };
}
