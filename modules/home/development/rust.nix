{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.development.rust = {
    enable = lib.mkEnableOption "enable rust toolchain and various dev tools";
  };

  config = lib.mkIf config.settings.development.rust.enable {
    home.packages = with pkgs; [
      cargo
      rustc
      rustfmt
      rust-analyzer
    ];
  };
}
