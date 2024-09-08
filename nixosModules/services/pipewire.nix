{ config, lib, ... }: {
  options.settings.services.audio = {
    enable = lib.mkEnableOption "enable sound through pipewire and its compat layers";
  };

  config = lib.mkIf config.settings.services.audio.enable {

    #enable RealtimeKit for realtime audio ( req by PulseAudio )
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
