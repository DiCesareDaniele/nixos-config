{ pkgs, ... }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    udev
    alsa-lib
    zlib
    vulkan-loader
    vulkan-tools
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    curl
    dbus
    expat
    fontconfig
    freetype
    fuse3
    gdk-pixbuf
    glib
    gtk3
    icu
    libGL
    libappindicator-gtk3
    libdrm
    libglvnd
    libnotify
    libpulseaudio
    libunwind
    libusb1
    libuuid
    libxkbcommon
    libxml2
    mesa
    nspr
    nss
    openssl
    pango
    pipewire
    stdenv.cc.cc
    systemd
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libxcb
    xorg.libxkbfile
    xorg.libXinerama
    xorg.libxshmfence
  ];
  NIX_LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
  shellHook = ''
    export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
  '';
}
