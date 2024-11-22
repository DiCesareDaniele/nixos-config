{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.cli-apps.nvim;
in {
  options.cli-apps.nvim = {
    enable = mkBoolOpt false "Whether to configure neovim";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ neovim ];
  };
}