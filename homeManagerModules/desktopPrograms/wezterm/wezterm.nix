{ ... }:
{
  programs.wezterm = {
    enable = true;
    #enableZshIntegration = true;
    extraConfig = builtins.replaceStrings [ "-- nix-replace" ] [ "" ] (builtins.readFile ./wezterm.lua);
  };
}
