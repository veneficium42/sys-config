{ config, lib, ... }:
{
  options.settings.programs.bat = {
    enable = lib.mkEnableOption "enable bat, cat replacement";
  };

  config = lib.mkIf config.settings.programs.bat.enable {
    programs.bat.enable = true;

    programs.fish.shellAliases = lib.mkIf config.settings.shell.fish.enable {
      "cat" = "bat";
    };
  };
}
