{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.apps.vscode;
in {
  options.apps.vscode = {
    enable = mkBoolOpt false "Whether to configure vscode";
  };
  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        vscodevim.vim
	ms-azuretools.vscode-docker
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        golang.go
        ms-python.python
      ];
    };
  };
}
