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

  programs.hyprlock.enable = true;

  systemd.user.targets.hyprland-session = {
    description = "Hyprland graphical session";
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
  };

  systemd.packages = [ pkgs.hyprpolkitagent ];
  systemd.user.services.hyprpolkitagent.wantedBy = [ "graphical-session.target" ];

  environment.systemPackages = with pkgs; [
    hyprpolkitagent
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
    wl-clip-persist
    cliphist
    brightnessctl
    nwg-displays
    #niri
    niri
    xwayland-satellite
    alacritty
  ];
}
