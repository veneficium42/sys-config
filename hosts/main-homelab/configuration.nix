{
  pkgs,
  lib,
  ...
}:
{

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../containers
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
      caddy.enable = lib.mkForce true;
    };

    containers = {
      jellyfin.enable = lib.mkForce true;
      qbittorrent.enable = lib.mkForce true;
      lidarr.enable = lib.mkForce true;
      homarr.enable = lib.mkForce true;
      prowlarr.enable = lib.mkForce true;
    };
  };

  networking.hostName = "veneficium-main-homelab-nixos";

  networking.networkmanager.enable = true;

  virtualisation.docker.enable = false;
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerSocket.enable = true;
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
  virtualisation.arion = {
    backend = "podman-socket";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      libvdpau-va-gl
    ];
  };

  users.extraUsers.veneficium.extraGroups = [ "podman" ];

  environment.systemPackages = with pkgs; [
    nano
    lshw
    fastfetch
    parted
    git-credential-manager
    pass-wayland
    git
    google-authenticator
    arion
    docker-client
  ];

  programs.zsh.enable = true;

  #DO NOT CHANGE THIS! IMPORTANT! DO NOT CHANGE THIS!
  system.stateVersion = "24.05"; # DO NOT CHANGE THIS!

}
