{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # GUI мониторинг
    gnome-system-monitor

    # CLI мониторинг
    sysstat
    atop
    htop
    btop

    # GPU мониторинг (для AMD)
    radeontop # AMD GPU загрузка

    # Системный мониторинг
    iotop # I/O по процессам
    iftop # Сетевой трафик
    nethogs # Трафик по процессам
    glances # Всё в одном (CPU, RAM, GPU, диск, сеть)
    bottom # Современный альтернативный мониторинг
  ];

  services.sysstat.enable = true;

  services.journald.extraConfig = ''
    SystemMaxUse=1G
    MaxRetentionSec=30day
  '';
}
