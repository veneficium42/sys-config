{ pkgs, ... }:
{

  imports = [
    ../../homeManagerModules/zsh.nix
    ../../homeManagerModules/starship.nix
    ../../homeManagerModules/desktopPrograms/essentials/firefox.nix

    ../../homeManagerModules/desktopPrograms/vscodium/vscodium.nix
    ../../homeManagerModules/desktopPrograms/amberol.nix

    ../../homeManagerModules/cliPrograms/hyfetch.nix
    ../../homeManagerModules/cliPrograms/bun.nix
    ../../homeManagerModules/cliPrograms/git.nix
    ../../homeManagerModules/cliPrograms/pass.nix
  ];

  #todo: EditorConfig support ( https://editorconfig.org )

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
    fira-code-nerdfont
    powertop
    git-credential-manager
    vesktop
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11"; # DO NOT CHANGE
  programs.home-manager.enable = true; # DO NOT CHANGE
}
