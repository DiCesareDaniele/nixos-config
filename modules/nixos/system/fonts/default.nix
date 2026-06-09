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
    environment.variables = {
      # Enable icons in tooling since we have nerdfonts.
      LOG_ICONS = "true";
    };

    environment.systemPackages = with pkgs; [ font-manager ];

    fonts.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig = {
      defaultFonts = {
        sansSerif = [ "JetBrainsMono Nerd Font" ];
        serif     = [ "JetBrainsMono Nerd Font" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
