{ config, ... }:
{
  networking.hostName = "veneficium-microvm-vaultwarden";
  microvm.hypervisor = "firecracker";
  system.stateVersion = config.system.nixos.version;
}
