{ config, lib, ... }: {
  options.settings = {
    services.openssh.enable = lib.mkEnableOption "enable openSSH";
    services.openssh.usePAM = lib.mkEnableOption "use PAM for ssh authentication";
  };


  #further move these options into settings
  config = lib.mkIf config.settings.services.openssh.enable {
    services.openssh = {
      enable = true;
      ports = [ 12342 ];
      settings = {
        UsePAM = config.settings.services.openssh.usePAM;
        PasswordAuthentication = true;
        AllowUsers = null;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password";
      };
    };
  };
}
