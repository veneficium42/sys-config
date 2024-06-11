{ config, lib, pkgs, ... }: {
	options = {
		settings.gnome.enable = lib.mkEnableOption "enable gnome de";
	};

	#todo make this more configurable
	config = lib.mkIf config.settings.gnome.enable {
		services.xserver = {
			enable = true;
			displayManager.gdm.enable = true;
			desktopManager.gnome.enable = true;
		};

		environment.systemPackages = [ pkgs.gnome.gnome-tweaks ];

		#enable browser connector for installing extensions
		services.gnome.gnome-browser-connector.enable = true;

		# Gnome enables pulse by default smh
		# make sure to have PIPEWIRE enabled!
		hardware.pulseaudio.enable = false;

		# remove various bloat
		environment.gnome.excludePackages = with pkgs.gnome; [ epiphany gnome-contacts gnome-maps gnome-music gnome-weather totem yelp pkgs.gnome-tour ];
	};
}