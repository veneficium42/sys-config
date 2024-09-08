{ lib, config, pkgs, ... }: {

  options.settings.drivers.ipod = {
    enable = lib.mkEnableOption "Enable necessary software for ipod communication";
  };

  config = lib.mkIf config.settings.drivers.ipod.enable {
    services.usbmuxd.enable = true;

    environment.systemPackages = with pkgs; [
      libimobiledevice
    ];
  };

}
