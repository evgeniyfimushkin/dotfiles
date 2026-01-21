{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    anki-bin
    obsidian
    webcord
    teamspeak6-client
    libreoffice-qt
    foliate
    google-chrome
  ];  

  programs = {
    firefox.enable = true;  
    xfconf.enable = true;
    thunar.enable = true;
    steam.enable = true;
  };

}
