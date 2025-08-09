{ config, lib, ... }:
{
  options.settings.programs.hyfetch = {
    enable = lib.mkEnableOption "enables hyfetch";
  };

  config = lib.mkIf config.settings.programs.hyfetch.enable {
    programs.hyfetch = {
      enable = true;
      settings = {
        preset = "nonbinary";
        lightness = 0.64;
        color_align = {
          mode = "horizontal";
        };
        backend = "fastfetch";
      };
    };
  };
}
