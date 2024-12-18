{ config, lib, ... }:
{
  options.settings.programs.git = {
    enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.settings.programs.git.enable {
    programs.git = {
      enable = true;
      userEmail = "85629831+veneficium42@users.noreply.github.com";
      userName = "Veneficium";
      extraConfig = {
        init.defaultBranch = "main";
        credential.credentialStore = "gpg";
      };
    };
  };
}
