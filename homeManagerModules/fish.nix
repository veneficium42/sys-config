{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.shell.fish = {
    enable = lib.mkEnableOption "enable fish shell";
  };

  config = lib.mkIf config.settings.shell.fish.enable {
    programs.fish = {
      enable = true;
      plugins = [
        {
          name = "fish-you-should-use";
          src = pkgs.fishPlugins.fish-you-should-use;
        }
      ];
    };
  };
}
