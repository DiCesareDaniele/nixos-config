{ config, lib, pkgs, osConfig, ... }: 
with lib;
with lib.internal;
let
  cfg = config.user;
  user = osConfig.user;
in {
  options.user = with types; {
    enable = mkOpt bool true "Whether to configure user";
    name = mkOpt str user.name "The name to use for the user account";
    fullName = mkOpt str user.fullName "The full name of the user";
    email = mkOpt str user.email "The email of the user";
  };
  config = mkIf cfg.enable {
    home = {
      username = cfg.name;
      homeDirectory = "/home/${cfg.name}";
      file = {
        "Pictures" = { source = ./Pictures; recursive = true; };
      };
    };
  };
}