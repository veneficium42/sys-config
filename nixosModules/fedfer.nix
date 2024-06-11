#need to move stuff to home-manager
{ pkgs, ... }: {
  users.users.fedfer = {
    isNormalUser = true;
    description = "FedFer";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}