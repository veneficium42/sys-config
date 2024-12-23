{ config, lib, ... }:
{
  options.settings.programs.gnupg = {
    enable = lib.mkEnableOption "enable gnuPG";
    ssh = lib.mkEnableOption "enable gnuPG ssh integration";
  };

  config = lib.mkIf config.settings.programs.gnupg.enable {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = config.settings.programs.gnupg.ssh;
    };
  };
}
