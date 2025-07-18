{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swayosd
    wl-clipboard
    wayland-utils
    libsecret
    xwayland-satellite-unstable
    playerctl
    pwvucontrol
  ];

  programs.swaylock = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./swaylock.json);
  };

  services.mako = {
    enable = true;
    settings = {
      sort = "+time";
      on-button-left = "invoke-default-action";
      on-button-middle = "dismiss-group";
      on-button-right = "dismiss";
      on-touch = "invoke-default-action";
      height = 99;
      width = 299;
      margin = 0;
      padding = 10;
      border-size = 1;
      border-radius = 1;
      icons = 1;
      layer = "top";
      anchor = "bottom-right";
      markup = 1;
      actions = 1;
      text-alignment = "center";
      default-timeout = 10000;
    };
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

  programs.fuzzel.enable = true;

  services.wpaperd.enable = true;
  programs.niri.config = builtins.readFile ./config.kdl;
}
