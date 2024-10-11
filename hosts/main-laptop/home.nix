{ pkgs, ... }:
{

  imports = [
    #../../homeManagerModules/zsh.nix
    ../../homeManagerModules/fish.nix

    ../../homeManagerModules/desktopPrograms/firefox.nix
    ../../homeManagerModules/desktopPrograms/wezterm/wezterm.nix
    ../../homeManagerModules/desktopPrograms/vscodium/vscodium.nix
    ../../homeManagerModules/desktopPrograms/amberol.nix

    ../../homeManagerModules/cliPrograms/starship/starship.nix
    ../../homeManagerModules/cliPrograms/fastfetch/fastfetch.nix
    ../../homeManagerModules/cliPrograms/hyfetch.nix
    ../../homeManagerModules/cliPrograms/bun.nix
    ../../homeManagerModules/cliPrograms/git.nix
    ../../homeManagerModules/cliPrograms/pass.nix
  ];

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
    ];
  };

  stylix = {
    enable = true;
    targets = {
      gnome.enable = true;
      gtk.enable = true;
      firefox.enable = true;
      vesktop.enable = true;
      wezterm.enable = true;
      helix.enable = true;
      vscode.enable = true;
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
    rustc
    rustfmt
    biome
    cargo
    python3
    impression
    chatterino2
    qbittorrent
    nil
    nixd
    nixpkgs-fmt
    nixfmt-rfc-style
    powertop
    git-credential-manager
    vesktop
    libreoffice-fresh
    valent
    logseq
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11"; # DO NOT CHANGE
  programs.home-manager.enable = true; # DO NOT CHANGE
}
