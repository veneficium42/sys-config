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

      extensions =
        with pkgs.vscode-marketplace;
        [
          ms-vscode.cpptools-extension-pack
          ms-vscode.live-server
          mhutchie.git-graph
          pkief.material-icon-theme
          pkief.material-product-icons
          oderwat.indent-rainbow
          bierner.markdown-emoji
          bierner.emojisense
          jnoortheen.nix-ide
          biomejs.biome
        ]
        ++ (with pkgs.open-vsx; [
          jeanp413.open-remote-ssh
          antfu.unocss
          bierner.markdown-preview-github-styles
          sumneko.lua
        ]);

      userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    };
  };
}
