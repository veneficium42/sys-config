{ config, lib, ... }:
{
  options.setting.programs.bat = {
    enable = lib.mkEnableOption "enable bat, cat replacement";
  };

  config = lib.mkIf config.settings.programs.bat {
    programs.bat.enable = true;

    programs.fish.shellAliases = lib.mkIf config.settings.shell.fish.enable {
      "cat" = "bat";
    };
  };
}
