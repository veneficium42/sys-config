{ config, lib, ... }:
{
  options.settings.programs.starship = {
    enable = lib.mkEnableOption "enable starship prompt";
  };

  config = lib.mkIf config.settings.programs.starship.enable {
    programs.starship = {
      enable = true;
      #enableZshIntegration = true;
      enableTransience = true;
      enableFishIntegration = true;

      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
  };
}
