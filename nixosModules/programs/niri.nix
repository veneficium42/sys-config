{ pkgs, ... }:
{
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
}
