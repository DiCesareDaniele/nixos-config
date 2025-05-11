{ pkgs, ... }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    openssl
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
  ];
  RUST_SRC_PATH = "${rust.packages.stable.rustPlatform.rustLibSrc}";
  # NIX_LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;
  # NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
  # shellHook = ''
  #   export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
  # '';
}
