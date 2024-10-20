{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.gtk;
in {
  options.desktop.addons.gtk = {
    enable = mkBoolOpt false "Whether to configure gtk";
  };
  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
      };
    };
  };
}