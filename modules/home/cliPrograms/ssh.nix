{ config, lib, ... }:
{
  options.settings.programs.ssh = {
    enable = lib.mkEnableOption "enable ssh home config";
  };

  config = lib.mkIf config.settings.programs.ssh.enable {
    programs.ssh = {
      enable = true;
      extraConfig = "Host 192.168.1.70
  SetEnv TERM=xterm-256color";
    };
  };

}
