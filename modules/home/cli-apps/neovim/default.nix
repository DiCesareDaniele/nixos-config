{ config, inputs, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.cli-apps.nvim;
in {
  options.cli-apps.nvim = {
    enable = mkBoolOpt false "Whether to configure neovim";
  };
  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    xdg.configFile.nvim = {
      source = ./nvim;
      recursive = true;
    };
  };
}
