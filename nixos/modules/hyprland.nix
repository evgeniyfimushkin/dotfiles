{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprlock
    hyprpaper
    hyprsunset
    hyprpicker
    hyprcursor
    hyprshot
    hypridle
    grim # for screenshot
    slurp # for screenshot
    waybar
    mako
    libnotify
    kitty
    wofi
    fastfetch # for flex
    wl-clipboard
    cliphist
    brightnessctl
    nwg-displays
    #niri
    niri
    xwayland-satellite
    alacritty
  ];
}
