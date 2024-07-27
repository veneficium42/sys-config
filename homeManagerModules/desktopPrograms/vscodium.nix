{ pkgs, ... }: {
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

    extensions = with pkgs.vscode-marketplace; [
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
      antfu.unocss
    ] ++ (with pkgs.open-vsx; [
      jeanp413.open-remote-ssh
  ]);

    userSettings = {
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.productIconTheme" = "material-product-icons";
      "editor.formatOnSave" = true;
      "workbench.sideBar.location" = "right";
      "workbench.startupEditor" = "welcomePageInEmptyWorkbench";
      "nix.enableLanguageServer" = true;
      "C_Cpp.clang_format_fallbackStyle" = "LLVM";
      "editor.fontFamily" = "FiraCode Nerd Font Mono";
      "editor.fontLigatures" = true;
      "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontWeight" = 500;
    };
  };
}
