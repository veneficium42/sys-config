{ config, pkgs, ... }: {

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fedfer-main-homelab-nixos";

  systemd.network.enable = true;

  environment.systemPackages = with pkgs; [
    nano
    lshw
    neofetch
    parted
  ];

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #DO NOT CHANGE THIS! IMPORTANT! DO NOT CHANGE THIS!
  system.stateVersion = "23.11"; #DO NOT CHANGE THIS!

}