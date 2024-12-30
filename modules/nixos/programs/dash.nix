{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.programs.dash = {
    enable = lib.mkEnableOption "Enable the dash shell";
    symlink-sh = lib.mkEnableOption "Symlink dash to /bin/sh";
  };

  config = lib.mkIf config.settings.programs.dash.enable {
    environment.systemPackages = [ pkgs.dash ];
    environment.binsh = lib.mkIf config.settings.programs.dash.symlink-sh "${pkgs.dash}/bin/dash";
  };
}
