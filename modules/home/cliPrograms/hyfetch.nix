{ config, lib, ... }:
{
  options.settings.programs.hyfetch = {
    enable = lib.mkEnableOption "enables hyfetch";
  };

  config = lib.mkIf config.settings.programs.hyfetch.enable {
    programs.hyfetch = {
      enable = true;
      #todo add hyfetch config
    };
  };
}
