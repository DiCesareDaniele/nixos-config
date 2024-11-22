{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
let
  cfg = config.tools.git;
  user = config.user;
in
{
  options.tools.git = {
    enable = mkBoolOpt false "Whether to install and configure git";
    userName = mkOpt types.str user.fullName "The name to configure git with";
    userEmail = mkOpt types.str user.email "The email to configure git with";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      inherit (cfg) userName userEmail;
      lfs = enabled;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = true;
        };
        push = {
          autoSetupRemote = true;
        };
        core = {
          whitespace = "trailing-space,space-before-tab";
        };
        url = {
          "ssh://git@github.com/" = {
            insteadOf = "https://github.com/";
          };
        };
      };
    };
  };
}
