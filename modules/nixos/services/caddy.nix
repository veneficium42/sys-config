{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.services.caddy = {
    enable = lib.mkEnableOption "enables caddy reverse-proxy";
  };

  config = lib.mkIf config.settings.services.caddy.enable {
    services.caddy.enable = true;
  };
}
