{
  config,
  lib,
  pkgs,
  ...
}:
{

  options.settings.programs.niri = {
    enable = lib.mkEnableOption "enables the niri window-manager";
  };

  config = lib.mkIf config.settings.programs.niri.enable {
    programs.niri.enable = true;
    programs.niri.package = pkgs.niri-unstable;

    security.pam.services.swaylock = { };

    gtk.iconCache.enable = true;

    environment.systemPackages = with pkgs; [
      swayosd
      wl-clipboard
      wayland-utils
      libsecret
      xwayland-satellite-unstable
    ];
  };
}
