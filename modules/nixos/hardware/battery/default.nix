{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.hardware.battery;
in {
  options.hardware.battery = {
    enable = mkBoolOpt false "Whether to configure battery";
  };
  config = mkIf cfg.enable {
    services.upower = enabled;
  };
}
