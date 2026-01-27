{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    anki-bin
    obsidian
    discord
    teamspeak6-client
    libreoffice-qt
    google-chrome
    transmission_4-gtk
    gimp
    foliate
  ];  

  programs = {
    firefox.enable = true;  
    xfconf.enable = true;
    thunar.enable = true;
    steam.enable = true;
  };

}
