{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.quickshell;
in {
  options.desktop.addons.quickshell = {
    enable = mkBoolOpt false "Whether to configure quickshell";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      quickshell
    ];
    xdg.configFile."quickshell" = { source = ./shell; recursive = true; };
  };
}
