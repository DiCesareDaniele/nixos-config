{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.gtk;
  theme = {
    name = cfg.theme;
  };
in {
  options.desktop.addons.gtk = with types; {
    enable = mkBoolOpt false "Whether to configure gtk";
    theme = mkOpt str "Adwaita-dark" "The gtk theme name";
  };
  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      inherit theme;
      gtk2.theme = theme;
      gtk3.theme = theme;
      gtk4.theme = theme;
    };
  };
}
