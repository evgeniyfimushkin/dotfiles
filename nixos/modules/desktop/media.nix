{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    pavucontrol
    playerctl
    mpv
    qimgv # photo viewer
    vlc
    ffmpeg
    # gstreamer plugins for DaVinci Resolve video decoding
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
