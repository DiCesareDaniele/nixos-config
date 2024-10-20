{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.system.time;
in {
  options.system.time = {
    enable = mkBoolOpt false "Whether to configure time zone";
    timeZone = mkOpt types.str "Europe/Rome" "Time zone";
  };
  config = mkIf cfg.enable {
    time = {
      inherit (cfg) timeZone;
    };
  };
}