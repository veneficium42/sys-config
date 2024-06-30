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
      ./programs/docker.nix
      ./programs/tailscale.nix
    ];

  settings = {
    programs.docker.enable = lib.mkDefault false;
    programs.tailscale.enable = lib.mkDefault false;

    drivers = {
      printer.M2020.enable = lib.mkDefault false;
      ipod.enable = lib.mkDefault false;

      gpu = {
        nvidia.enable = lib.mkDefault false;
        nvidia.forceDisable = lib.mkDefault true;
        amd.enable = lib.mkDefault false;
      };
    };

    services.printing.enable = lib.mkDefault false;
    services.audio.enable = lib.mkDefault false;

    gnome.enable = lib.mkDefault false;

  };
}