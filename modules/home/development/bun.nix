{ config, lib, ... }:
{
  options.settings.development.bun = {
    enable = lib.mkEnableOption "enable bun for js development";
  };

  config = lib.mkIf config.settings.development.bun.enable {
    programs.bun = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
