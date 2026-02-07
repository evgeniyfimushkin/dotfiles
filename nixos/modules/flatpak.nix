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
    # "com.usebottles.bottles"
    # "net.davidotek.pupgui2"
  ];

  services.flatpak.uninstallUnmanaged = true;
  services.flatpak.update.onActivation = true;
}
