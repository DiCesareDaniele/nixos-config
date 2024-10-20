{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.system.locale;
in {
  options.system.locale = {
    enable = mkBoolOpt false "Whether to configure locale";
    defaultLocale = mkOpt types.str "en_US.UTF-8" "Default Locale";
  };
  config = mkIf cfg.enable {
    i18n = {
      inherit (cfg) defaultLocale;
    };
  };
}