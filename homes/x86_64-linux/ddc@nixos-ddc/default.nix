{ config, lib, pkgs, ... }:
with lib;
with lib.internal;
{
  snowfallorg.user = enabled;
  archetypes = {
    work = enabled;
  };
  tools.git.userName = "DiCesareDaniele";
}
