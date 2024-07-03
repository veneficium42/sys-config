{ config, lib, ... }: {
  options = {
    settings.services.fstrim.enable = lib.mkEnableOption "enables fstrim";
  };

  config = lib.mkIf config.settings.services.fstrim.enable {
    services.fstrim.enable = true;
  };
}