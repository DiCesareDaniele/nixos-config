{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.hardware.networking;
in {
  options.hardware.networking = {
    enable = mkBoolOpt false "Whether to configure networking";
  };
  config = mkIf cfg.enable {
    networking = {
      networkmanager = enabled;
      firewall = {
        enable = true;
        extraCommands = ''
          iptables -A INPUT -i docker0 -j ACCEPT
        '';
      };
    };
  };
}
