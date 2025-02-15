{ config, lib, ... }:
{
  options.settings.programs.ghostty = {
    enable = lib.mkEnableOption "enable ghostty terminal emulator";
  };

  config = lib.mkIf config.settings.programs.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      installBatSyntax = true;
    };
  };
}
