{ lib, config, ... }:
{

  options.settings.drivers.gpu.amd = {
    enable = lib.mkEnableOption "enable AMD gpu drivers";
  };

  config = lib.mkIf config.settings.drivers.gpu.amd.enable {
    boot.initrd.kernelModules = [ "amdgpu" ];
    services.xserver.videoDrivers = [ "amdgpu" ];
  };
}
