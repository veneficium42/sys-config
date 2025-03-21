{ lib, ... }:
{
  imports = [
    ./system/boot.nix
    ./system/nix.nix
    ./system/locale.nix

    ./users/fedfer.nix
    ./users/veneficium.nix

    ./drivers/samsung-printer.nix
    ./drivers/ipod.nix
    ./drivers/openrazer.nix
    ./drivers/gpu/amd.nix
    ./drivers/gpu/nvidia.nix
    ./drivers/gpu/disableNvidia.nix

    ./services/gnome.nix
    ./services/pipewire.nix
    ./services/printing.nix
    ./services/fstrim.nix
    ./services/tlp.nix
    ./services/switcheroo.nix
    ./services/pam.nix
    ./services/openssh.nix
    ./services/caddy.nix

    ./programs/docker.nix
    ./programs/tailscale.nix
    ./programs/powertop.nix
    ./programs/gnupg.nix
    ./programs/dash.nix

    ./programs/tuigreet.nix
    ./programs/niri.nix
  ];

  settings = {
    system.boot.windows.enable = lib.mkDefault false;

    users.fedfer.enable = lib.mkDefault false;
    users.veneficium.enable = lib.mkDefault false;

    programs = {
      tailscale.enable = lib.mkDefault false;

      powertop.enable = lib.mkDefault true;
      gnupg.enable = lib.mkDefault true;
      gnupg.ssh = lib.mkDefault true;

      niri.enable = lib.mkDefault false;
      tuigreet.enable = lib.mkDefault false;
      docker.enable = lib.mkDefault false;

      dash.enable = lib.mkDefault true;
      dash.symlink-sh = lib.mkDefault true;
    };

    drivers = {
      printer.M2020.enable = lib.mkDefault false;
      ipod.enable = lib.mkDefault false;
      openrazer.enable = lib.mkDefault false;

      gpu = {
        nvidia = {
          enable = lib.mkDefault false;
          forceDisable = lib.mkDefault true;
          sync = lib.mkDefault false;
          offload = lib.mkDefault true;
        };

        amd.enable = lib.mkDefault false;
      };
    };

    services = {
      printing.enable = lib.mkDefault false;
      audio.enable = lib.mkDefault false;
      fstrim.enable = lib.mkDefault true;
      tlp.enable = lib.mkDefault false;
      switcheroo.enable = lib.mkDefault false;
      pam = {
        enable = lib.mkDefault false;
        sshd.useGoogleAuth = lib.mkDefault false;
        sshd.gnupg = lib.mkDefault false;
      };
      openssh.enable = lib.mkDefault false;
      openssh.usePAM = lib.mkDefault false;
      caddy.enable = lib.mkDefault false;
    };

    gnome.enable = lib.mkDefault false;

  };
}
