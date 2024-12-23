{ config, lib, ... }:
{
  options.settings.programs.amberol = {
    enable = lib.mkEnableOption "enable amberol music player";
  };

  config = lib.mkIf config.settings.programs.amberol.enable {
    services.amberol.enable = true;
  };
}
