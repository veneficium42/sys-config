{ lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../nixosModules/default.nix
  ];

  settings = {
    programs.docker.enable = lib.mkForce true;
    programs.tailscale.enable = lib.mkForce true;

    drivers = {
      printer.M2020.enable = lib.mkForce true;
      ipod.enable = lib.mkForce true;
      gpu.amd.enable = lib.mkForce true;
    };

    gnome.enable = lib.mkForce true;
    services.printing.enable = lib.mkForce true;
    services.audio.enable = lib.mkForce true;
  };

  specialisation = {
    nvidia.configuration = {
      settings.drivers.gpu.nvidia.forceDisable = lib.mkForce false;
      settings.drivers.gpu.nvidia.enable = lib.mkForce true;
      settings.services.switcheroo.enable = lib.mkForce true;
      environment.systemPackages = with pkgs; [ blender.override { cudaSupport = true; } ];
    };
  };

  #enable wayland for electron programs
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.configurationLimit = 10;

  #todo look further into networking options
  #could be pretty interesting
  networking.hostName = "fedfer-main-laptop-nixos";

  networking.networkmanager.enable = true;

  #todo need to move this to modules
  services = {
    libinput = {
        enable = true;
        touchpad = {
          tapping = true;
        };
      };
  };
  
  #remove various bloat
  services.xserver.excludePackages = with  pkgs; [ xterm ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  #todo modularize!
  programs.xwayland.enable = true;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nano
    lshw
    zsh
    fastfetch
    gparted
    gcc
  ];

  #enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11"; #DO NOT CHANGE THIS!

}
