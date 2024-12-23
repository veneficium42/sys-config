{ config, lib, ... }:
{
  options.settings.services.pam = {
    enable = lib.mkEnableOption "enables PAM";
    sshd = {
      useGoogleAuth = lib.mkEnableOption "use pam_google_authenticator.so module";
      gnupg = lib.mkEnableOption "enable gnuPG integration";
    };
  };

  config = lib.mkIf config.settings.services.pam.enable {
    security.pam = {
      services.sshd = {
        name = "sshd";
        unixAuth = true;
        googleAuthenticator.enable = config.settings.services.pam.sshd.useGoogleAuth;
        gnupg.enable = config.settings.services.pam.sshd.gnupg;
      };
    };
  };
}
