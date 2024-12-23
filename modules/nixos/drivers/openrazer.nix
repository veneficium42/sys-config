{ config, lib, ... }:
{
  options.settings.drivers.openrazer = {
    enable = lib.mkEnableOption "Enable the openrazer drivers for razer device-specific features (IE RGB lights control)";
  };

  config = lib.mkIf config.settings.drivers.openrazer.enable {
    hardware.openrazer.enable = true;
    hardware.openrazer.users = [
      "fedfer"
      "veneficium"
    ];
  };
}
