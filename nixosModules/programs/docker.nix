{ lib, config, ... }: {
  options.settings.programs.docker = {
    enable = lib.mkEnableOption "enables docker";
  };

  config = lib.mkIf config.settings.programs.docker.enable {
    virtualisation.docker.enable = true;
  };
}
