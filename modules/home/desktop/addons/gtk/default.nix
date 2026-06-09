{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.desktop.addons.gtk;
  gtk = {
    colorScheme = "dark";

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };

    # already set in modules/home/desktop/hyprland/default.nix
    # cursor = { ... };
  };
in {
  options.desktop.addons.gtk = with types; {
    enable = mkBoolOpt false "Whether to configure gtk";
  };
  config = mkIf cfg.enable {
    gtk = {
      enable = true;

      inherit (gtk) theme iconTheme;

      gtk3 = gtk;
      gtk4 = gtk;

      # TODO: build css file
      # xdg.configFile = {
      #   "gtk-3.0/gtk.css".source = finalCss;
      #   "gtk-4.0/gtk.css".source = finalCss;
      # };
    };
  };
}
