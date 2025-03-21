{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.containers.homarr = {
    enable = lib.mkEnableOption "enable homarr arion container";
  };

  config = lib.mkIf config.settings.containers.homarr.enable {
    virtualisation.arion.projects.homarr = {
      settings = {
        project.name = "homarr";
        services.homarr = {
          service.useHostStore = true;
          service.image = "ghcr.io/homarr-labs/homarr:latest";
          service.ports = [
            "7575:7575"
          ];
          service.volumes = [
            "/config/homarr:/appdata"
          ];
          service.environment = {
            SECRET_ENCRYPTION_KEY = "01661ad7a4b6a838eb49d4d5a5a252499f8602c2d828953045947ee29a1adaf4";
          };
        };
      };
    };
  };
}
