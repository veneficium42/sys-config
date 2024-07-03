{ config, lib, ... }: {
  options = {
    settings.services.tlp.enable = lib.mkEnableOption "enables tlp for power management";
  };

  config = lib.mkIf config.settings.services.tlp.enable {
    services.tlp.enable = true;
  };
}
