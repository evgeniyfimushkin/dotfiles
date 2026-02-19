{
  config,
  lib,
  pkgs,
  ...
}:
{
  boot.kernelModules = [ "nvme" ];
  services.fstrim.enable = true;
  services.fstrim.interval = "weekly";
}
