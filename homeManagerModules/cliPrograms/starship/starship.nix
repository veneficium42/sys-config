{ ... }:
{
  programs.starship = {
    enable = true;
    #enableZshIntegration = true;
    enableTransience = true;
    enableFishIntegration = true;

    settings = builtins.fromTOML (builtins.readFile ./starship.toml);
  };
}
