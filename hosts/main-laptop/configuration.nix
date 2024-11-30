{ lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/default.nix
  ];

  qt.style = "adwaita";
  services.blueman.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "fedfer" ];

  stylix.enable = true;
  stylix.autoEnable = true;
  stylix = {
    polarity = "dark";
    image = ../../res/wallpaper.png;
    cursor = {
      package = pkgs.catppuccin-cursors.macchiatoMauve;
      name = "catppuccin-macchiato-mauve-cursors";
    };
    fonts = {
      serif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };
      sansSerif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };
      monospace = {
        package = pkgs.fira-code-nerdfont;
        name = "FiraCode Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/eighties.yaml";
    targets = {
      console.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      nixos-icons.enable = true;
      fish.enable = true;
      kmscon.enable = true;
    };
  };

  programs.fish.enable = true;

  settings = {
    users.fedfer.enable = lib.mkForce true;

    programs.docker.enable = lib.mkForce true;
    programs.tailscale.enable = lib.mkForce true;
    programs.gnupg.enable = lib.mkForce true;
    programs.gnupg.ssh = lib.mkForce true;
    programs.niri.enable = lib.mkForce true;

    drivers = {
      printer.M2020.enable = lib.mkForce true;
      ipod.enable = lib.mkForce true;
      openrazer.enable = lib.mkForce true;
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
      environment.systemPackages = [ (pkgs.blender.override { cudaSupport = true; }) ];
    };
  };

  #enable wayland for electron programs
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.edk2-uefi-shell.enable = true;
  boot.loader.systemd-boot.windows = {
    "11" = {
      title = "Windows 11 (gaming)";
      efiDeviceHandle = "FS0";
    };
  };
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
  services.xserver.excludePackages = with pkgs; [ xterm ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  #todo modularize!
  programs.xwayland.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nano
    lshw
    fastfetch
    gparted
    gcc
  ];

  #enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.05"; # DO NOT CHANGE THIS!

}
