{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.apps.bloomrpc;
in {
  options.apps.bloomrpc = {
    enable = mkBoolOpt false "Whether to configure bloomrpc";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ bloomrpc ];
  };
}
