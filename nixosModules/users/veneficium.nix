{ config, lib, ... }: {
  options.settings = {
    users.veneficium.enable = lib.mkEnableOption "enables user Veneficium";
  };

  users.users.veneficium = lib.mkIf config.settings.users.veneficium.enable {
    isNormalUser = true;
    description = "Veneficium";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}