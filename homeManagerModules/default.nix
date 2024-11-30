{ lib, ... }:
{
  imports = [
    #./zsh.nix
    ./fish.nix
    ./niri/niri.nix

    ./development/rust.nix
    ./development/bun.nix

    ./cliPrograms/pass.nix
    ./cliPrograms/hyfetch.nix
    ./cliPrograms/git.nix

    ./cliPrograms/starship/starship.nix
    ./cliPrograms/fastfetch/fastfetch.nix

    ./desktopPrograms/firefox.nix
    ./desktopPrograms/amberol.nix

    ./desktopPrograms/zed/zed.nix
    ./desktopPrograms/wezterm/wezterm.nix
    ./desktopPrograms/vscodium/vscodium.nix
  ];

  settings = {
    shell.fish.enable = lib.mkDefault true;

    development = {
      rust = {
        enable = lib.mkDefault false;
        enableVSCode = lib.mkDefault false;
      };

      bun.enable = lib.mkDefault false;
    };

    programs = {
      firefox.enable = lib.mkDefault false;
      amberol.enable = lib.mkDefault false;
      wezterm.enable = lib.mkDefault false;
      vscodium.enable = lib.mkDefault false;
      zed.enable = lib.mkDefault false;

      pass.enable = lib.mkDefault true;
      hyfetch.enable = lib.mkDefault false;
      git.enable = lib.mkDefault true;
      starship.enable = lib.mkDefault false;
      fastfetch.enable = lib.mkDefault true;
    };
  };

}
