{ config, ... }:
{
  networking.hostName = "veneficium-microvm-vaultwarden";
  microvm.hypervisor = "cloud-hypervisor";
  microvm.shares = [
    {
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
      tag = "ro-store";
    }
  ];
  system.stateVersion = config.system.nixos.version;
}
