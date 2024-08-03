{ pkgs, ... }: {

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  services.vscode-server = {
    enable = true;
    enableFHS = true;
    installPath = "$HOME/.vscodium-server";
  };
  programs.nix-ld.enable = true;
  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "veneficium-main-homelab-nixos";

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "it2";

  environment.systemPackages = with pkgs; [
    nano
    lshw
    neofetch
    parted
    git-credential-manager
    pass-wayland
    git
  ];

  users.users.veneficium = {
    isNormalUser = true;
    description = "Veneficium";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };


  programs.zsh.enable = true;

  services.openssh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #DO NOT CHANGE THIS! IMPORTANT! DO NOT CHANGE THIS!
  system.stateVersion = "24.05"; #DO NOT CHANGE THIS!

}
