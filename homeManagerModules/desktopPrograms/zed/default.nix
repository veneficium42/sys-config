{ config, lib, ... }:
{
  options.settings.programs.zed = {
    enable = lib.mkEnableOption "enable zed editor";
  };

  config = lib.mkIf config.settings.programs.zed.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [ "nix" ];
      userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    };
  };
}
