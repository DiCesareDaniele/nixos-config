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
    hardware = {
      audio = enabled;
      bluetooth = enabled;
      networking = enabled;
    };
    system = {
      boot = enabled;
      fonts = enabled;
      locale = enabled;
      time = enabled;
      xkb = enabled;
    };
    tools = {
      # nix-ld = enabled;
    };
  };
}
