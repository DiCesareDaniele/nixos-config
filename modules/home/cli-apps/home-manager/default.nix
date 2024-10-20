{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.cli-apps.home-manager;
in {
  options.cli-apps.home-manager = {
    enable = mkBoolOpt false "Whether to configure home-manager";
  };
  config = mkIf cfg.enable {
    programs.home-manager = enabled;
  };
}