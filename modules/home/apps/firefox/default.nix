{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.apps.firefox;
in {
  options.apps.firefox = {
    enable = mkBoolOpt false "Whether to configure firefox";
  };
  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
    };
  };
}
