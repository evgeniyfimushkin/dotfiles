{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pavucontrol
    playerctl
    mpv
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
