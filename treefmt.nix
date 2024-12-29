{ ... }:
{
  projectRootFile = "flake.nix";

  programs.nixfmt.enable = true;
  programs.biome.enable = true;
  programs.stylua.enable = true;
  programs.taplo.enable = true;
  programs.mdformat.enable = true;
  programs.shellcheck.enable = true;
}
