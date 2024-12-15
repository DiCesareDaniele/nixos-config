{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.desktop.i3;
in {
  options.desktop.i3 = {
    enable = mkBoolOpt false "Whether to configure i3";
  };
  config = mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
        windowManager.i3 = enabled;
      };
      displayManager = {
        defaultSession = "none+i3";
      };
    };
    programs.dconf = enabled;
  };
}
