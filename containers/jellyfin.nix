{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.containers.jellyfin = {
    enable = lib.mkEnableOption "enable jellyfin arion container";
  };

  config = lib.mkIf config.settings.containers.jellyfin.enable {
    virtualisation.arion.projects.jellyfin = {
      settings = {
        project.name = "jellyfin";
        services.jellyfin = {
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

              services.jellyfin.enable = true;
              services.jellyfin.openFirewall = true;
            };
          service.ports = [ "8096:8096" ];
          service.devices = [ "/dev/dri/renderD128:/dev/dri/renderD128" ];
        };
      };
    };
  };
}
