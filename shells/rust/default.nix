{ pkgs, ... }:
with pkgs;
mkShell {
  packages = [
    cargo
    rustc
    rust-analyzer
  ];
  RUST_SRC_PATH = "${rust.packages.stable.rustPlatform.rustLibSrc}";
}
