{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.programs.tuigreet = {
    enable = lib.mkEnableOption "enables the tuigreet greeter";
  };

  config = lib.mkIf config.settings.programs.tuigreet.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t -g \"Haii! :3\" --theme \"container=black;input=lightBlue;prompt=green;greet=magenta;border=blue\"";
          user = "greeter";
        };
      };
    };
  };
}
