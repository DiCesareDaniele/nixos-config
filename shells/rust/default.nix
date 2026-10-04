{ ... }:
let
  rust_overlay = import (
    fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"
  );
  pkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
  # rust = pkgs.rust-bin.selectLatestNightlyWith (
  #   toolchain:
  #   toolchain.default.override {
  #     extensions = [
  #       "rust-src"
  #       "rust-analyzer"
  #       "clippy-preview"
  #     ];
  #   }
  # );
  rustVersion = "2026-08-01";
  rust = pkgs.rust-bin.nightly.${rustVersion}.default.override {
    extensions = [
      "rust-src"
      "rust-analyzer"
      "clippy-preview"
    ];
  };
in
pkgs.mkShell {
  buildInputs = [
    rust
  ]
  ++ (with pkgs; [
    taplo # .toml formatter
    pkg-config
  ]);
  RUST_BACKTRACE = 1;
}
