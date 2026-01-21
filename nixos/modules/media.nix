{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pavucontrol
    playerctl
    mpv
    qimgv
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
