{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.nix;
in {
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wget
      unzip
      vim
      git
    ];

    nix = {
      settings.experimental-features = [ "nix-command" "flakes" ];
      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 7d";
      };
    };
  };
}
