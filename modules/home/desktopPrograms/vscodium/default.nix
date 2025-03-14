{
  config,
  lib,
  pkgs,
  ...
}:
{
  #The VSCoderrrrrrrr
  #codepilled nixmaxxer
  #god I love tumblr
  #tumblrpilled mememaxxer

  options.settings.programs.vscodium = {
    enable = lib.mkEnableOption "enable vscode for development";
  };

  config = lib.mkIf config.settings.programs.vscodium.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      mutableExtensionsDir = false;

      extensions = lib.mkMerge [
        (with pkgs.vscode-marketplace; [
          ms-vscode.live-server
          mhutchie.git-graph
          pkief.material-icon-theme
          pkief.material-product-icons
          oderwat.indent-rainbow
          bierner.markdown-emoji
          bierner.emojisense
          jnoortheen.nix-ide
          kdl-org.kdl
        ])
        (with pkgs.open-vsx; [
          jeanp413.open-remote-ssh
          bierner.markdown-preview-github-styles
          sumneko.lua
        ])
        (with pkgs.vscode-extensions; [
          ms-vscode.cpptools
        ])
        (lib.mkIf config.settings.development.rust.enable (
          with pkgs.vscode-extensions;
          [
            rust-lang.rust-analyzer
          ]
          ++ (with pkgs.open-vsx; [
            tamasfe.even-better-toml
          ])
        ))
      ];

      userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    };
  };
}
