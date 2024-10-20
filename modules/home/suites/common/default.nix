{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.suites.common;
in {
  options.suites.common = {
    enable = mkBoolOpt false "Whether to enable common configuration";
  };
  config = mkIf cfg.enable {
    cli-apps = {
      zsh = enabled;
    };
  };
}