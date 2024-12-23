{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swayosd
    fuzzel
    wl-clipboard
    wayland-utils
    libsecret
    xwayland-satellite-unstable
    playerctl
    pwvucontrol
  ];

  services.mako = {
    enable = true;
    extraConfig = builtins.readFile ./mako.conf;
  };
  services.swayosd = {
    enable = true;
  };
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [
      (builtins.fromJSON (builtins.readFile ./waybar.json))
    ];
    style = builtins.readFile ./waybar.css;
  };
  programs.wpaperd.enable = true;
  programs.niri.config = builtins.readFile ./config.kdl;
}
