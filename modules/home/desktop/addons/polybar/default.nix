{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.polybar;
in {
  options.desktop.addons.polybar = {
    enable = mkBoolOpt false "Whether to configure polybar";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      (polybar.override {
        pulseSupport = true;
        i3Support = true;
      })
      killall
    ];
    xdg.configFile."polybar/launch.sh".source = ./launch.sh;
    xdg.configFile."polybar/config" = { source = ./config; recursive = true; };
    xdg.configFile."polybar/bin" = { source = ./bin; recursive = true; };
  };
}