{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.containers.wg-easy = {
    enable = lib.mkEnableOption "enable wg-easy arion container";
    host-public-addr = lib.mkOption {
      description = "The public address of the host system";
      type = lib.types.str;
    };
  };

  config = lib.mkIf config.settings.containers.wg-easy.enable {
    virtualisation.arion.projects.wg-easy = {
      settings = {
        project.name = "wg-easy";
        services.wg-easy = {
          service.useHostStore = true;
          service.image = "ghcr.io/wg-easy/wg-easy:latest";
          service.ports = [
            "51820:51820/udp"
            "51821:51821/tcp"
          ];
          service.volumes = [
            "/config/wg-easy:/etc/wireguard"
          ];
          service.capabilities = {
            NET_ADMIN = true;
            NET_RAW = true;
            SYS_MODULE = true;
          };
          service.sysctls = {
            net.ipv4.ip_forward = 1;
            net.ipv4.conf.all.src_valid_mark = 1;
          };
          service.environment = {
            WG_HOST = config.settings.containers.wg-easy.host-public-addr;
          };
        };
      };
    };
  };
}
