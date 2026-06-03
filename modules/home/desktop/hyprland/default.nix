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
      polybar = enabled;
      networkmanager-dmenu = enabled;
    };
    home.packages = with pkgs; [
      pamixer
      brightnessctl
      feh 
      maim
      xclip
    ];
    xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
    # xdg.configFile."i3/themes/catppuccin-mocha".source = ./themes/catppuccin-mocha;
  };
}
