{ config, pkgs, ... }:

{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  services.flatpak.enable = true;

  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://flathub.org/repo/flathub.flatpakrepo";
    }
  ];

  services.flatpak.packages = [
    "runtime/org.freedesktop.Platform/x86_64/25.08"
    "runtime/org.freedesktop.Platform.Locale/x86_64/25.08"
    "com.usebottles.bottles"
  ];
  services.flatpak.uninstallUnmanaged = true;
  services.flatpak.update.onActivation = true;
}
