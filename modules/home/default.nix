{ lib, ... }:
{
  imports = [
    ./shells/fish.nix
    ./niri/niri.nix

    ./development/rust.nix
    ./development/bun.nix

    ./cliPrograms/pass.nix
    ./cliPrograms/hyfetch.nix
    ./cliPrograms/git.nix

    ./cliPrograms/starship
    ./cliPrograms/fastfetch
    ./cliPrograms/helix
    ./cliPrograms/neovim

    ./desktopPrograms/firefox.nix
    ./desktopPrograms/amberol.nix

    ./desktopPrograms/zed
    ./desktopPrograms/wezterm
    ./desktopPrograms/vscodium
  ];

  settings = {
    shell.fish.enable = lib.mkDefault true;

    development = {
      rust.enable = lib.mkDefault false;
      bun.enable = lib.mkDefault false;
    };

    programs = {
      firefox.enable = lib.mkDefault false;
      amberol.enable = lib.mkDefault false;
      wezterm.enable = lib.mkDefault false;
      vscodium.enable = lib.mkDefault false;
      zed.enable = lib.mkDefault false;

      pass.enable = lib.mkDefault true;
      fastfetch.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      hyfetch.enable = lib.mkDefault false;
      starship.enable = lib.mkDefault false;
      helix.enable = lib.mkDefault false;
      neovim.enable = lib.mkDefault false;
    };
  };

}
