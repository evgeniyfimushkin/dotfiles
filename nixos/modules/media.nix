{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    pavucontrol
    playerctl
    mpv
    qimgv # photo viewer
    vlc
    ffmpeg
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
