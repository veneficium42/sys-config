{ config, lib, ... }:
{
  options.settings.programs.wezterm = {
    enable = lib.mkEnableOption "enable wezterm terminal emulator";
  };

  config = lib.mkIf config.settings.programs.wezterm.enable {
    programs.wezterm = {
      enable = true;
      #enableZshIntegration = true;
      extraConfig = builtins.replaceStrings [ "-- nix-replace" ] [ "" ] (builtins.readFile ./wezterm.lua);
    };
  };
}
