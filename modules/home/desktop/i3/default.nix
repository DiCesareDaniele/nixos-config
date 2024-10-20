{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.i3;
in {
  options.desktop.i3 = {
    enable = mkBoolOpt false "Whether to configure i3";
  };
  config = mkIf cfg.enable {
    desktop.addons = {
      gtk = enabled;
      alacritty = enabled;
      rofi = enabled;
      picom = enabled;
      polybar = enabled;
      networkmanager-dmenu = enabled;
    };
    home.packages = with pkgs; [
      pamixer
      brightnessctl
      feh
    ];
    xdg.configFile."i3/config".source = ./config;
    xdg.configFile."i3/themes/catppuccin-mocha".source = ./themes/catppuccin-mocha;
  };
}