{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.programs.dash = {
    enable = lib.mkEnableOption "Enable the dash shell";
    symlink_sh = lib.mkEnableOption "Symlink dash to /bin/sh";
  };

  config = lib.mkIf config.programs.dash.enable {
    environment.systemPackages = [ pkgs.dash ];
    environment.binsh = lib.mkIf config.programs.dash.symlink_sh "${pkgs.dash}/bin/dash";
  };
}
