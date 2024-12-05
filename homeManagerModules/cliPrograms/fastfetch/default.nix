{ config, lib, ... }:
{
  options.settings.programs.fastfetch = {
    enable = lib.mkEnableOption "enable fastfetch";
  };

  config = lib.mkIf config.settings.programs.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./config.jsonc);
    };
  };
}
