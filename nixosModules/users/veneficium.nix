{ config, lib, ... }: {
  options.settings = {
    users.veneficium.enable = lib.mkEnableOption "enables user Veneficium";
  };

  config = lib.mkIf config.settings.users.veneficium.enable {
    users.users.veneficium = {
      isNormalUser = true;
      description = "Veneficium";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}