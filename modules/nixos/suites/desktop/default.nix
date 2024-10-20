{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.suites.desktop;
in {
  options.suites.desktop = {
    enable = mkBoolOpt false "Whether to enable common desktop configuration";
  };
  config = mkIf cfg.enable {
    desktop = {
      i3 = enabled;
    };
  };
}