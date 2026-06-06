{
  pkgs ? import <nixpkgs> {},
  ...
}:
with pkgs;
mkShell {
  buildInputs = [
    lua
    stylua
    lua-language-server
  ];
}
