{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.archetypes.work;
in {
  options.archetypes.work = {
    enable = mkBoolOpt false "Whether to enable common work archetype";
  };
  config = mkIf cfg.enable {
    suites = {
      common = enabled;
      desktop = enabled;
      development = enabled;
    };
  };
}