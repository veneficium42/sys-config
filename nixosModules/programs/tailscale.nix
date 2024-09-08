{ config, lib, ... }: {
  options.settings.programs.tailscale = {
    enable = lib.mkEnableOption "enable tailscale";
  };

  config = lib.mkIf config.settings.programs.tailscale.enable {
    services.tailscale.enable = true;
  };
}
