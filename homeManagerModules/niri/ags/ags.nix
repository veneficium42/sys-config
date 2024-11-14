{ inputs, pkgs, ... }:
{
  programs.ags = {
    enable = true;

    configDir = ../ags;

    # additional packages to add to gjs's runtime
    extraPackages = [
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.mpris
      inputs.ags.packages.${pkgs.system}.wireplumber
      inputs.ags.packages.${pkgs.system}.network
      inputs.ags.packages.${pkgs.system}.tray
    ];
  };

  home.packages = [
    inputs.ags.packages.${pkgs.system}.io
    inputs.ags.packages.${pkgs.system}.battery
    inputs.ags.packages.${pkgs.system}.mpris
    inputs.ags.packages.${pkgs.system}.wireplumber
    inputs.ags.packages.${pkgs.system}.network
    inputs.ags.packages.${pkgs.system}.tray
  ];
}
