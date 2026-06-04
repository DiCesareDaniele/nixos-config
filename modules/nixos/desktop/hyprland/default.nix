{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.desktop.hyprland;
in {
  options.desktop.hyprland = {
    enable = mkBoolOpt false "Whether to configure hyprland";
  };
  config = mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    programs.dconf = enabled;
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";

      GDK_SCALE = "1";
      GDK_DPI_SCALE = "1";

      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_SCALE_FACTOR = "1";

      XCURSOR_SIZE = "24";
    };
  };
}
