{ config, lib, ... }:
{
  options.settings.programs.kitty = {
    enable = lib.mkEnableOption "enable kitty terminal emulator";
  };

  config = lib.mkIf config.settings.programs.kitty.enable {
    programs.kitty = {
      enable = true;
      enableFishIntegration = config.settings.shell.fish.enable;
    };
  };
}
