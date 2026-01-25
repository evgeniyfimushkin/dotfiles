{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    anki-bin
    obsidian
    webcord
    discord
    teamspeak6-client
    libreoffice-qt
    google-chrome
    transmission_4-gtk
  ];  

  programs = {
    firefox.enable = true;  
    xfconf.enable = true;
    thunar.enable = true;
    steam.enable = true;
  };

}
