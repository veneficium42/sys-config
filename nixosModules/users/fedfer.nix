#need to move stuff to home-manager
{ pkgs, config, lib, ... }: {
  options.settings.users.fedfer = {
    enable = lib.mkEnableOption "enables user FedFer";
  };

  config = lib.mkIf config.settings.users.fedfer.enable {
    users.users.fedfer = {
      isNormalUser = true;
      description = "FedFer";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
    };
  };
}
