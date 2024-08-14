{ config, lib, ... }: {
  options.settings = {
    programs.gnupg.enable = lib.mkEnableOption "enable gnuPG";
    programs.gnupg.ssh = lib.mkEnableOption "enable gnuPG ssh integration";
  };

  programs.gnupg.agent = lib.mkIf config.settings.programs.gnupg.enable {
    enable = true;
    enableSSHSupport = config.settings.programs.gnupg.ssh;
  };
}