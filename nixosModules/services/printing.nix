{ config, lib, ... }:
{
  options.settings.services.printing = {
    enable = lib.mkEnableOption "enable printing";
  };

  config = lib.mkIf config.settings.services.printing.enable {
    services = {
      printing = {
        enable = true;
      };
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
