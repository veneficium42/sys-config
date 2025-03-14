{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.settings.programs.helix = {
    enable = lib.mkEnableOption "enables the helix modal editor";
  };

  config = lib.mkIf config.settings.programs.helix.enable {
    programs.helix = {
      enable = true;
      extraPackages = with pkgs; [ markdown-oxide ];
      settings = builtins.fromTOML (builtins.readFile ./config.toml);
      languages = builtins.fromTOML (builtins.readFile ./languages.toml);
    };
  };
}
