{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.user;
in {
  options.user = with types; {
    name = mkOpt str "ddc" "The name to use for the user account";
    fullName = mkOpt str "Di Cesare Daniele" "The full name of the user";
    email = mkOpt str "dicesaredaniele7@gmail.com" "The email of the user";
    initialPassword =
      mkOpt str ""
        "The initial password to use when the user is first created";
    extraGroups = mkOpt (listOf str) [] "Groups for the user to be assigned";
  };
  config = {
    programs.zsh = {
      enable = true;
    };
    users.users.${cfg.name} = {
      inherit (cfg) name initialPassword extraGroups;
      home = "/home/${cfg.name}";
      isNormalUser = true;
      group = "users";
      shell = pkgs.zsh;
    };
  };
}