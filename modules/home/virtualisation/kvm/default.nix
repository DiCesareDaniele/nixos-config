{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.virtualisation.kvm;
in {
  options.virtualisation.kvm = with types; {
    enable = mkBoolOpt false "Whether to configure KVM";
  };
  config = mkIf cfg.enable {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };
}
