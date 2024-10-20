{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.virtualisation.docker;
in {
  config = mkIf cfg.enable {
    user.extraGroups = [ "docker" ];
  };
}