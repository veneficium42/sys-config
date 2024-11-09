{ ... }:
{
  services.mako = {
    enable = true;
    extraConfig = builtins.readFile ./mako.conf;
  };
  programs.niri.config = builtins.readFile ./config.kdl;
}
