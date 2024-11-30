{ config, lib, ... }:
{
  options.settings.programs.zed = {
    enable = lib.mkEnableOption "enable zed editor";
  };

  config = lib.mkIf config.settings.programs.zed.enable {
    programs.zed-editor = {
      enable = true;
      userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    };
  };
}
