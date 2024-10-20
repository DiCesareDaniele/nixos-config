{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.networkmanager-dmenu;
in {
  options.desktop.addons.networkmanager-dmenu = {
    enable = mkBoolOpt false "Whether to configure networkmanager-dmenu";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ networkmanager_dmenu ];
    xdg.configFile."networkmanager-dmenu/config.ini".source = ./config.ini;
  };
}