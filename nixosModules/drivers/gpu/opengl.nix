{ config, lib, ... }: {
  options = {
    settings.drivers.gpu.opengl.enable = lib.mkEnableOption "enable OpenGL hardware support";
  };

  config = lib.mkIf config.settings.drivers.gpu.opengl.enable {
    hardware.opengl = {
			enable = true;
			driSupport32Bit = true;
    };
  };
}