{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.binsh = "${pkgs.bash}/bin/sh";

  systemd.tmpfiles.rules = [
    "L+ /bin/bash - - - - ${pkgs.bash}/bin/bash"
  ];
}
