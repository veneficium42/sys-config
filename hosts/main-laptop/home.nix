{
  lib,
  pkgs,
  ...
}:
{

  imports = [ ../../modules/home ];

  settings = {
    development = {
      rust.enable = lib.mkForce true;
      bun.enable = lib.mkForce true;
    };

    programs = {
      firefox.enable = lib.mkForce true;
      amberol.enable = lib.mkForce true;
      vscodium.enable = lib.mkForce true;
      kitty.enable = lib.mkForce true;
      ghostty.enable = true;

      starship.enable = lib.mkForce true;
      helix.enable = lib.mkForce true;
      hyfetch.enable = lib.mkForce true;
      neovim.enable = lib.mkForce true;
    };
  };

  #todo: EditorConfig support ( https://editorconfig.org )

  services.mpris-proxy.enable = true;

  stylix = {
    enable = true;
    autoEnable = true;
    iconTheme = {
      enable = true;
      package = pkgs.marwaita-icons;
      dark = "Marwaita-Dark-Purple";
      light = "Marwaita-Light-Purple";
    };
    targets = {
      gnome.enable = true;
      gtk.enable = true;
      firefox.enable = true;
      vesktop.enable = true;
      wezterm.enable = true;
      helix.enable = true;
      vscode.enable = true;
      fish.enable = true;
      wpaperd.enable = true;
      kitty.enable = false;
    };
  };

  home.username = "fedfer";
  home.homeDirectory = "/home/fedfer";

  home.keyboard.layout = "it";

  xdg.enable = true;
  home.preferXdgDirectories = true;

  home.packages = with pkgs; [
    prismlauncher
    foliate
    biome
    python3
    impression
    chatterino2
    qbittorrent
    nixd
    nixpkgs-fmt
    nixfmt-rfc-style
    powertop
    git-credential-manager
    vesktop
    libreoffice
    valent
    zapzap
    kicad-small
    freecad-wayland
    resources
    pmbootstrap
    celluloid
    fractal
    yazi
    # logseq requires electron 27 which is EOL therefore temp disable until upstream pkg updates
    #logseq
  ];

  home.stateVersion = "23.11"; # DO NOT CHANGE
  programs.home-manager.enable = true; # DO NOT CHANGE
}
