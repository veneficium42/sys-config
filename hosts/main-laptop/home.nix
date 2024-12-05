{
  lib,
  inputs,
  pkgs,
  ...
}:
{

  imports = [ ../../homeManagerModules ];

  settings = {
    development = {
      rust.enable = lib.mkForce true;
      bun.enable = lib.mkForce true;
    };

    programs = {
      firefox.enable = lib.mkForce true;
      amberol.enable = lib.mkForce true;
      wezterm.enable = lib.mkForce true;
      vscodium.enable = lib.mkForce true;

      starship.enable = lib.mkForce true;
      hyfetch.enable = lib.mkForce true;
    };
  };

  #todo: EditorConfig support ( https://editorconfig.org )

  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.valent; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.dash-to-dock; }
      { package = pkgs.gnomeExtensions.tray-icons-reloaded; }
      { package = pkgs.gnomeExtensions.native-window-placement; }
      { package = pkgs.gnomeExtensions.system-monitor; }
      { package = pkgs.gnomeExtensions.highlight-focus; }
    ];
  };

  stylix = {
    enable = true;
    autoEnable = true;
    targets = {
      gnome.enable = true;
      gtk.enable = true;
      firefox.enable = true;
      vesktop.enable = true;
      wezterm.enable = true;
      helix.enable = true;
      vscode.enable = true;
      fish.enable = true;
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
    # logseq requires electron 27 which is EOL therefore temp disable until upstream pkg updates
    #logseq
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11"; # DO NOT CHANGE
  programs.home-manager.enable = true; # DO NOT CHANGE
}
