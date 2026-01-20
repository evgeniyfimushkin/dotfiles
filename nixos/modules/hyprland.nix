{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
	  enable = true;
	  package = pkgs.hyprland;
    xwayland.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    hyprlock
    hyprlock
    hyprpaper
    hyprsunset
    hyprpicker
    hyprcursor
    hyprshot
    grim # for screenshot
    slurp # for screenshot
    waybar
    mako
    kitty
    wofi
    fastfetch # for flex
    wl-clipboard
    cliphist
    brightnessctl
  ];
}
