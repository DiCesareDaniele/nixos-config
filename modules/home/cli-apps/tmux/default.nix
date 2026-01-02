{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.cli-apps.zsh;
in {
  options.cli-apps.tmux = {
    enable = mkBoolOpt false "Whether to configure tmux";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ tmux fzf ];
    xdg.configFile."tmux/tmux.conf".source = ./tmux.conf;
    xdg.configFile."tmux/scripts" = { source = ./scripts; recursive = true; };
  };
}
