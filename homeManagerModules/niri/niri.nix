{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    extraConfig = builtins.readFile ./mako.conf;
  };
  services.swayosd = {
    enable = true;
  };
  programs.yambar = {
    enable = true;
    settings = builtins.readFile ./yambar.yml;
  };
  programs.niri.config = builtins.readFile ./config.kdl;
  home.packages = with pkgs; [
    playerctl
  ];
}
