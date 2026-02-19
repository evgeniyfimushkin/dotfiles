{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    gnome-system-monitor
    sysstat
  ];

  services.sysstat.enable = true;

  services.journald.extraConfig = ''
    SystemMaxUse=1G
    MaxRetentionSec=30day
  '';
}
