{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    anki-bin
    obsidian
    discord
    element-desktop
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
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-vaapi # optional AMD hardware acceleration
        obs-gstreamer
        obs-vkcapture
      ];
    };
  };

}
