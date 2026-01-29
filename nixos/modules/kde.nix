{
  config,
  lib,
  pkgs,
  ...
}:
{
  # services.xserver.enable = true; # optional
  # services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
