{
  pkgs,
  config,
  lib,
  ...
}:
{

  options.settings.system.boot = {
    windows.enable = lib.mkEnableOption "Enable windows dual boot";
  };

  config = {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot.enable = true;
      systemd-boot.edk2-uefi-shell.enable = true;
      systemd-boot.configurationLimit = 10;
      systemd-boot.editor = false;

      systemd-boot.windows = lib.mkIf config.settings.system.boot.windows.enable {
        "11" = {
          title = "Windows";
          efiDeviceHandle = "FS0";
        };
      };
    };
  };
}
