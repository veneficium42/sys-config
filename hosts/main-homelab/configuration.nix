{ pkgs, ... }: {

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "veneficium-main-homelab-nixos";

  networking.networkmanager.enable = true;

  services.openssh = {
  enable = true;
  ports = [ 12342 ];
  settings = {
    PasswordAuthentication = true;
    AllowUsers = null;
    UsePAM = true;
    X11Forwarding = false;
    PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  security.pam = {
    services.sshd = {
      name = "sshd";
      unixAuth  = true;
      googleAuthenticator.enable = true;
      gnupg.enable = true;
    };
  };

  time.timeZone = "Europe/Rome";

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

  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  console.keyMap = "it";

  environment.systemPackages = with pkgs; [
    nano
    lshw
    neofetch
    parted
    git-credential-manager
    pass-wayland
    git
    google-authenticator
  ];

  users.users.veneficium = {
    isNormalUser = true;
    description = "Veneficium";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };


  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #DO NOT CHANGE THIS! IMPORTANT! DO NOT CHANGE THIS!
  system.stateVersion = "24.05"; #DO NOT CHANGE THIS!

}
