{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.development.rust = {
    enable = lib.mkEnableOption "enable rust toolchain and various dev tools";
    enableVSCode = lib.mkEnableOption "enable VSCode extension for rust";
  };

  config = lib.mkIf config.settings.development.rust.enable {
    home.packages = with pkgs; [
      cargo
      rustc
      rustfmt
    ];

    programs.vscode.extensions = lib.mkIf config.settings.development.rust.enableVSCode (
      with pkgs.vscode-extensions;
      [
        rust-lang.rust-analyzer
      ]
      ++ (with pkgs.open-vsx; [
        tamasfe.even-better-toml
      ])
    );
  };
}
