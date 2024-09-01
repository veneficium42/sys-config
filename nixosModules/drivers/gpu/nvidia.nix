{ lib, config, ... }: {

  options = {
    settings.drivers.gpu.nvidia.enable = lib.mkEnableOption "Enable Nvidia proprietary drivers";
    settings.drivers.gpu.nvidia.offload = lib.mkEnableOption "Enable prime offloading";
    settings.drivers.gpu.nvidia.sync = lib.mkEnableOption "Enable prime sync";
  };

  config = lib.mkIf config.settings.drivers.gpu.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement.enable = true;
      prime = {
        nvidiaBusId = "pci:1:0:0";
        amdgpuBusId = "pci:5:0:0";
      };
      prime.offload = lib.mkIf config.settings.drivers.gpu.nvidia.offload {
        enable = true;
        enableOffloadCmd = true;
      };
      prime.sync.enable = lib.mkIf config.settings.drivers.gpu.nvidia.sync true;
      nvidiaSettings = true;
    };
  };
}
