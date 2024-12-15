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
    programs.virt-manager = enabled;
    
    virtualisation = {
      libvirtd = enabled;
      spiceUSBRedirection = enabled;
    };

    services = {
      qemuGuest = enabled;
      spice-vdagentd = enabled;
    };
    
    user = {
      extraGroups = [
        "qemu-libvirtd"
        "libvirtd"
        "disk"
      ];
    };
  };
}
