{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.system.boot;
in {
  options.system.boot = {
    enable = mkBoolOpt false "Whether to configure booting";
  };
  config = mkIf cfg.enable {
    boot.loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}