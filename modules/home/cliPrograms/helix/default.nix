{ config, lib, ... }:
{
  options.settings.programs.helix = {
    enable = lib.mkEnableOption "enables the helix modal editor";
  };

  config = lib.mkIf config.settings.programs.helix.enable {
    programs.helix = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./config.toml);
    };
  };
}
