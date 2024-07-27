{ pkgs, ... }: {

  imports = [
    ../../homeManagerModules/zsh.nix
    ../../homeManagerModules/starship.nix
    ../../homeManagerModules/desktopPrograms/essentials/firefox.nix

    ../../homeManagerModules/desktopPrograms/vscodium.nix
    ../../homeManagerModules/desktopPrograms/vesktop.nix

    ../../homeManagerModules/cliPrograms/hyfetch.nix
    ../../homeManagerModules/cliPrograms/bun.nix
    ../../homeManagerModules/cliPrograms/git.nix
  ];

  home.username = "fedfer";
  home.homeDirectory = "/home/fedfer";

  xdg.enable = true;

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
    fira-code-nerdfont
    powertop
    git-credential-manager
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11"; #DO NOT CHANGE
  programs.home-manager.enable = true; #DO NOT CHANGE
}
