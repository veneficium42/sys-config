{ pkgs, lib, ... }:
{
  #The VSCoderrrrrrrr
  #codepilled nixmaxxer
  #god I love tumblr
  #tumblrpilled mememaxxer

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;

    extensions =
      with pkgs.vscode-extensions;
      [
        ms-vscode.cpptools
        ms-vscode.live-server
        mhutchie.git-graph
        pkief.material-icon-theme
        pkief.material-product-icons
        oderwat.indent-rainbow
        bierner.markdown-emoji
        bierner.emojisense
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
        biomejs.biome
      ]
      ++ (with pkgs.open-vsx; [
        jeanp413.open-remote-ssh
        antfu.unocss
        tamasfe.even-better-toml
      ]);

    userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
  };
}
