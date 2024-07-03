{ config, lib, ... }: {
  options = {
    settings.programs.powertop.enable = lib.mkEnableOption "enables powertop";
  };

  config = lib.mkIf config.settings.programs.powertop.enable {
    powerManagement.powertop.enable = true;
  };
}
