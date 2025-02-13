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

              services.mopidy.enable = true;
              services.mopidy.dataDir = "/config/mopidy";
              services.mopidy.extensionPackages = with pkgs; [
                mopidy-mpd
                mopidy-jellyfin
              ];
              services.mopidy.configuration = ''
                [mpd]
                enabled = true
                hostname = 0.0.0.0
                port = 6600
                connection_timeout = 300
              '';

              systemd.services.mopidy.serviceConfig.User = lib.mkForce "root";
            };
          service.ports = [ "8096:8096" ];
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
