{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.gnome = {
    enable = lib.mkEnableOption "enable gnome de";
  };

  config = lib.mkIf config.settings.gnome.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    environment.systemPackages = [ pkgs.gnome-tweaks ];

    #enable browser connector for installing extensions
    services.gnome.gnome-browser-connector.enable = true;

    # Gnome enables pulse by default smh
    # make sure to have PIPEWIRE enabled
    hardware.pulseaudio.enable = false;

    # remove various bloat
    environment.gnome.excludePackages = with pkgs; [
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-weather
      gnome-tour
      epiphany
      totem
      yelp
    ];
  };
}
