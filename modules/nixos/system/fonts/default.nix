{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.system.fonts;
in {
  options.system.fonts = {
    enable = mkBoolOpt false "Whether to configure fonts";
  };
  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}