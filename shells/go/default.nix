{
  pkgs ? import <nixpkgs> { },
  ...
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    go
  ];
  shellHook = ''
    export PATH="$HOME/go/bin:$PATH"
    export GOPATH="$HOME/go"
  '';
}
