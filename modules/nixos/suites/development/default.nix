{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.suites.development;
in {
  options.suites.development = {
    enable = mkBoolOpt false "Whether to enable common development configuration";
  };
  config = mkIf cfg.enable {
    tools = {
      go = enabled;
    };
    virtualisation = {
      docker = enabled;
      kvm = enabled;
    };
  };
}
