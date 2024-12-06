{ config, lib, ... }:
{
  options.settings.programs.neovim = {
    enable = lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.settings.programs.neovim.enable {
    programs.neovim = {
      enable = true;
    };
  };
}
