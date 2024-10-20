{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.tools.nix-ld;
in {
  options.tools.nix-ld = {
    enable = mkBoolOpt false "Whether to configure nix-ld";
  };
  config = mkIf cfg.enable {
    programs.nix-ld.dev = enabled;
  };
}
