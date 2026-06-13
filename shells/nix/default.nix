{
  pkgs ? import <nixpkgs> { },
  ...
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nixd
    nixfmt
    nixfmt-tree
  ];
}
