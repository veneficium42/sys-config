{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.programs.firefox = {
    enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.settings.programs.firefox.enable {
    #todo config
    programs.firefox = {
      enable = true;
      #todo make sure this on only if gnome is setup correctly
      nativeMessagingHosts = [ pkgs.gnome-browser-connector ];
    };
  };
}
