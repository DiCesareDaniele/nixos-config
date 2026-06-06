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

      withRuby = false;
      withPython3 = false;
    };
    xdg.configFile.nvim = { source = ./nvim; recursive = true; };
    home.packages = with pkgs; [
      wl-clipboard
      cmake
      tree-sitter
    ];
    programs.zsh.shellAliases = {
      clip = "wl-copy";
    };
  };
}
