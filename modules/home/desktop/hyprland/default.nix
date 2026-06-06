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
    desktop.addons = {
      gtk = enabled;
      alacritty = enabled;
      rofi = enabled;
      # picom = enabled;
      # polybar = enabled;
      quickshell = enabled;
      networkmanager-dmenu = enabled;
    };
    home.packages = with pkgs; [
      playerctl
      brightnessctl
      maim
      wl-clipboard
      awww
    ];
    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      x11 = enabled;
      gtk = enabled;
      hyprcursor = enabled;
    };
    xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
    xdg.configFile."hypr/colors.lua".source = ./colors.lua;
  };
}
