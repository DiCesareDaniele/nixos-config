{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.system.xkb;
in {
  options.system.xkb = {
    enable = mkBoolOpt false "Whether to configure xkb";
    layout = mkOpt types.str "us" "xkb layout";
  };
  config = mkIf cfg.enable {
    services.xserver.xkb = {
      inherit (cfg) layout;
    };
  };
}