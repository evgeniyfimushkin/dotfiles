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
    serviceConfig = {
      Type = "oneshot";
      User = "eugene";
      Group = "eugene";
      ExecStart = "/home/eugene/scripts/obsidian-sync.sh";
      Path = [ pkgs.git ];
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
