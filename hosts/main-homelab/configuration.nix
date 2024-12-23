{
  self,
  pkgs,
  lib,
  ...
}:
{

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  settings = {
    users.veneficium.enable = lib.mkForce true;

    programs.gnupg.enable = lib.mkForce true;
    programs.gnupg.ssh = lib.mkForce true;

    services = {
      pam = {
        enable = lib.mkForce true;
        sshd.useGoogleAuth = lib.mkForce true;
        sshd.gnupg = lib.mkForce true;
      };
      openssh.enable = lib.mkForce true;
      openssh.usePAM = lib.mkForce true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "veneficium-main-homelab-nixos";

  networking.networkmanager.enable = true;

  virtualisation.arion = {
    backend = "podman-socket";
  };

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

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  #DO NOT CHANGE THIS! IMPORTANT! DO NOT CHANGE THIS!
  system.stateVersion = "24.05"; # DO NOT CHANGE THIS!

}
