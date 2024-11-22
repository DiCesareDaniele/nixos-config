{ pkgs, ... }:
with pkgs;
mkShell {
  packages = [
    cargo
    rustc
    rust-analyzer
    rustfmt
  ];
  RUST_SRC_PATH = "${rust.packages.stable.rustPlatform.rustLibSrc}";
}
