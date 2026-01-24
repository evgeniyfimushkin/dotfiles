{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pavucontrol
    playerctl
    mpv
    qimgv # photo viewer
    vlc
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
