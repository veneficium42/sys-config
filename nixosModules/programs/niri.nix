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

    environment.systemPackages = with pkgs; [
      swayosd
      fuzzel
      alacritty
      wl-clipboard
      wayland-utils
      libsecret
      xwayland-satellite-unstable
    ];
  };
}
