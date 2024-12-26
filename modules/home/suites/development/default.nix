{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.suites.development;
in {
  options.suites.development = {
    enable = mkBoolOpt false "Whether to enable common development configuration";
  };
  config = mkIf cfg.enable {
    tools = {
      git = enabled;
    };
    cli-apps = {
      home-manager = enabled;
      nvim = enabled;
    };
    apps = {
      vscode = enabled;
      bloomrpc = enabled;
      android-studio = enabled;
    };
    virtualisation = {
      kvm = enabled;
    };
  };
}
