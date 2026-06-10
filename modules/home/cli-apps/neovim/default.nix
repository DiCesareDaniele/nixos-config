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
    home.packages = with pkgs; [
      # TODO: this packages should probably not be here
      fd
      wl-clipboard
      gnumake
      tree-sitter
    ];
    programs.zsh.shellAliases = {
      clip = "wl-copy";
    };
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;

      withNodeJs = false;
      withPython3 = false;
      withRuby = false;
    };
    xdg.configFile.nvim = { source = ./nvim; recursive = true; };
  };
}
