{ ... }:
let
  rust_overlay = import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz");
  pkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
  rust = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
    extensions = [
      "rust-src"
      "rust-analyzer"
      "clippy-preview"
    ];
  });
in
pkgs.mkShell {
  buildInputs = [
    rust
  ] ++ (with pkgs; [
    pkg-config
  ]);
  RUST_BACKTRACE = 1;
}
