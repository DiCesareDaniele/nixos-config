{
  lib,
  osConfig,
  ...
}:
with lib;
with lib.internal;
{
  xdg = enabled;
  home.stateVersion = lib.mkDefault osConfig.system.stateVersion;
}
