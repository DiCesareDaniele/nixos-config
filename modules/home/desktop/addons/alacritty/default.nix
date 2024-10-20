{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.alacritty;
in {
  options.desktop.addons.alacritty = {
    enable = mkBoolOpt false "Whether to configure alacritty";
  };
  config = mkIf cfg.enable {
    programs.alacritty = enabled;
    home.sessionVariables = {
      "TERMINAL" = "alacritty";
    };
    xdg.configFile."alacritty/alacritty.toml".source = ./alacritty.toml;
    xdg.configFile."alacritty/themes/catppuccin-mocha.toml".source = ./themes/catppuccin-mocha.toml;
  };
}