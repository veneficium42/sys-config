{ ... }: {
  #todo config
  programs.zsh = {
    enable = true;
    completionInit.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "systemd"
        "bun"
        "common-aliases"
      ];
    };
  };
}
