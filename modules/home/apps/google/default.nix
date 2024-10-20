{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.apps.google;
in {
  options.apps.google = {
    enable = mkBoolOpt false "Whether to configure google";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ google-chrome ];
  };
}