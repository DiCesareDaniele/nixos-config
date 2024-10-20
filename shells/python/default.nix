{ pkgs, ... }:
with pkgs;
mkShell {
  packages = [
    python3
    poetry
  ];
}