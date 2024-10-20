{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
{
  # Uncomment this lines to enable passing options to home-manager from nixos
  # options.home = {
  #   file = mkOpt attrs {} "A set of files managed by home-manager's `home.file`";
  #   configFile = mkOpt types.attrs {} "A set of files managed by home-manager's `xdg.configFile`";
  #   extraOptions = mkOpt types.attrs {} "Options to pass directly to home-manager";
  # };
  config = {
    # Uncomment this lines to enable passing options to home-manager from nixos
    # home.extraOptions = {
    #   home.stateVersion = config.system.stateVersion;
    #   home.file = mkAliasDefinitions options.home.file;
    #   xdg = enabled;
    #   xdg.configFile = mkAliasDefinitions options.home.configFile;
    # };

    # snowfallorg.users.${config.user.name}.home.config = 
    #   config.home.extraOptions;

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
    };
  };
}