{ lib, ... }: {
  imports =
    [
      ./fedfer.nix

      ./drivers/samsung-printer.nix
      ./drivers/ipod.nix
      ./drivers/gpu/amd.nix
      ./drivers/gpu/nvidia.nix
      ./drivers/gpu/disableNvidia.nix

      ./services/locale.nix #todo turn into config module?
      ./services/gnome.nix
      ./services/pipewire.nix
      ./services/printing.nix
      ./services/fstrim.nix
      ./services/tlp.nix

      ./programs/docker.nix
      ./programs/tailscale.nix
      ./programs/powertop.nix
    ];

  settings = {
    programs.docker.enable = lib.mkDefault false;
    programs.tailscale.enable = lib.mkDefault false;
    programs.powertop.enable = lib.mkDefault true;

    drivers = {
      printer.M2020.enable = lib.mkDefault false;
      ipod.enable = lib.mkDefault false;

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
      switcheroo = lib.mkDefault false;
    };

    gnome.enable = lib.mkDefault false;

  };
}
