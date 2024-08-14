#need to move stuff to home-manager
{ pkgs, config, lib, ... }: {
  options.settings = {
    users.fedfer.enable = lib.mkEnableOption "enables user FedFer";
  };

  users.users.fedfer = lib.mkIf config.settings.users.fedfer.enable {
    isNormalUser = true;
    description = "FedFer";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
