{
  config,
  lib,
  ...
}:
with lib;
with lib.internal;
let
  cfg = config.hardware.bluetooth;
in
{
  config = mkIf cfg.enable { };
}
