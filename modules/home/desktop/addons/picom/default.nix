{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.picom;
in {
  options.desktop.addons.picom = {
    enable = mkBoolOpt false "Whether to configure picom";
  };
  config = mkIf cfg.enable {
    services.picom = enabled;
    xdg.configFile."picom/picom.conf".source = ./picom.conf;
  };
}