{
  config,
  lib,
  ...
}:
with lib;
with lib.internal;
let
  cfg = config.suites.development;
in
{
  options.suites.development = {
    enable = mkBoolOpt false "Whether to enable common development configuration";
  };
  config = mkIf cfg.enable {
    virtualisation = {
      docker = enabled;
      kvm = enabled;
    };
  };
}
