{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.rofi;
in {
  options.desktop.addons.rofi = {
    enable = mkBoolOpt false "Whether to configure rofi";
  };
  config = mkIf cfg.enable {
    programs.rofi = enabled;
    xdg.configFile."rofi/config" = { source = ./config; recursive = true; };
    xdg.configFile."rofi/bin" = { source = ./bin; recursive = true; };
  };
}