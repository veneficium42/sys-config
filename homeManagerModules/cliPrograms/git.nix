{ ... }: {
  #todo config
  programs.git = {
    enable = true;
    userEmail = "85629831+veneficium42@users.noreply.github.com";
    userName = "Veneficium";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}