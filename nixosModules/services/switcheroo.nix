{ config, lib, ... }: {
  options = {
    settings.services.switcheroo.enable = lib.mkEnableOption "enable switcheroo-control for nvidia optimus management";
  };

  config = lib.mkIf config.settings.services.switcheroo.enable {
    services.switcherooControl.enable = true;
  };
}