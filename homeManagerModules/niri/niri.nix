{ pkgs, ... }:
{

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
  programs.niri.config = builtins.readFile ./config.kdl;
  home.packages = with pkgs; [
    playerctl
  ];
}
