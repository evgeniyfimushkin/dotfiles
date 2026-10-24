{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.services.obsidian-sync = {
    description = "obsidian sync";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    path = [
      pkgs.git
      pkgs.openssh
      pkgs.coreutils
    ];
    serviceConfig = {
      Type = "oneshot";
      User = "eugene";
      ExecStart = "${pkgs.bash}/bin/bash ${../../../scripts/obsidian-sync.sh}";
    };
  };

  systemd.timers.obsidian-sync = {
    description = "Daily obsidian sync timer";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily"; # runs in 0:00
      Persistent = true; # runs anyway even if pc was shut in 0:00
      Unit = "obsidian-sync.service";
    };
  };
}
