{ pkgs, ... }:
{
  imports = [ ./ags.nix ];

  services.mako = {
    enable = true;
    extraConfig = builtins.readFile ./mako.conf;
  };
  services.swayosd = {
    enable = true;
  };
  programs.niri.config = builtins.readFile ./config.kdl;
  home.packages = with pkgs; [
    playerctl
  ];
}
