{ lib, config, ... }: {
  #todo look further into virt options
  options = {
    settings.programs.docker.enable = lib.mkEnableOption "enables docker";
  };

  config = lib.mkIf config.settings.programs.docker.enable {
    virtualisation.docker.enable = true;
  };
}