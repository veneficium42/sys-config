{ config, ... }:
{
  networking.hostName = "veneficium-microvm-vaultwarden";
  microvm.hypervisor = "firecracker";
  microvm.shares = [
    {
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
      tag = "ro-store";
      proto = "virtiofs";
    }
  ];
  system.stateVersion = config.system.nixos.version;
}
