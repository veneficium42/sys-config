{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cargo
    rustc
    rustfmt
  ];

  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [
      rust-lang.rust-analyzer
    ]
    ++ (with pkgs.open-vsx; [
      tamasfe.even-better-toml
    ]);
}
