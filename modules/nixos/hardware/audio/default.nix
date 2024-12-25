{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.hardware.audio;
in {
  options.hardware.audio = {
    enable = mkBoolOpt false "Whether to configure audio";
  };
  config = mkIf cfg.enable {
    services = {
      pipewire = {
        enable = true;
        audio = enabled;
        pulse = enabled;
        jack = enabled;
        alsa = {
          enable = true;
          support32Bit = true;
        };
      };
    };
  };
}
