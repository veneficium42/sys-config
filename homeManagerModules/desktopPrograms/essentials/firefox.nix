{ pkgs, ... }: {
  #todo config
  programs.firefox = {
    enable = true;
    #todo make sure this on only if gnome is setup correctly
    nativeMessagingHosts = [ pkgs.gnome-browser-connector ];
  };
}