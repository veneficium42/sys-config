{
  config,
  lib,
  pkgs,
  ...
}:
{

  options.settings.programs.pass = {
    enable = lib.mkEnableOption "enable pass";
  };

  config = lib.mkIf config.settings.programs.pass.enable {
    programs.password-store = {
      enable = true;
      package = pkgs.pass-wayland.withExtensions (exts: [
        exts.pass-checkup
        exts.pass-audit
      ]);
    };
  };
}
