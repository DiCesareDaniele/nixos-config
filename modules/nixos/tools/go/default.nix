{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.tools.go;
in {
  options.tools.go = {
    enable = mkBoolOpt false "Whether to configure Go";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ go ];
    environment.sessionVariables = {
      PATH = "$HOME/go/bin:$PATH";
      GOPATH = "$HOME/go";
    };
  };
}