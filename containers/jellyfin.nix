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

              systemd.oomd.enable = false;

              hardware.graphics = {
                enable = true;
                extraPackages = with pkgs; [
                  intel-media-driver
                  vpl-gpu-rt
                  libvdpau-va-gl
                ];
              };

              services.jellyfin.enable = true;
              services.jellyfin.openFirewall = true;
              services.jellyfin.dataDir = "/config";
              services.jellyfin.user = "root";
            };
          service.ports = [
            "8096:8096"
            "6600:6600"
            "6680:6680"
          ];
          service.devices = [ "/dev/dri/renderD128:/dev/dri/renderD128" ];
          service.volumes = [
            "/config/jellyfin:/config"
            "/data/media:/media"
          ];
        };
      };
    };
  };
}
