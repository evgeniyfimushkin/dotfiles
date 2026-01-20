{ config, pkgs, ... }:

{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    pkgs.flatpak
  ];

}
