{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.apps.typst;
in {
  options.apps.typst = {
    enable = mkBoolOpt false "Whether to configure typst";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      typst
      tinymist
      typstyle
      watchexec
    ];
  };
}
