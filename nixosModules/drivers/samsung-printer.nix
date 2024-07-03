{ lib, config, pkgs, ... }: {
  #use driver compatible with samsung M2020 printer
  options = {
    settings.drivers.printer.M2020.enable = lib.mkEnableOption "use the appropriate driver for the samsung M2020 printer";
  };

  config = lib.mkIf config.settings.drivers.printer.M2020.enable {
    services.printing.drivers = [ pkgs.samsung-unified-linux-driver_1_00_37 ];
  };
}
