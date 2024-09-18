{ ... }:
{
  imports = [ ./fastfetch.nix ];
  programs.hyfetch = {
    enable = true;
    #todo add hyfetch config
  };
}
