{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.apps.android-studio;
in {
  options.apps.android-studio = {
    enable = mkBoolOpt false "Whether to configure android-studio";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ android-studio ];
  };
}
