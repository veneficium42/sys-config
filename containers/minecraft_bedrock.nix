{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.containers.minecraft = {
    enable = lib.mkEnableOption "enable qbittorrent arion container";
  };

  config = lib.mkIf config.settings.containers.minecraft.enable {
    virtualisation.arion.projects.minecraft = {
      settings = {
        project.name = "minecraft";
        services.minecraft = {
          service.useHostStore = true;
          service.image = "itzg/minecraft-bedrock-server:latest";
          service.ports = [
            "19132:19132/udp"
          ];
          service.volumes = [
            "/config/mc-bedrock:/data"
          ];
          service.environment = {
            "EULA" = "TRUE";
            "LEVEL_SEED" = "122104056270";
          };
        };
      };
    };
  };
}
