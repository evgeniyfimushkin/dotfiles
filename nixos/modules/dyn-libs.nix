{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam-run
  ];
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [
      pkgs.libepoxy
    ];
  };


  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    mesa
    libGL
    libglvnd
    zlib
    fontconfig
    freetype
    xorg.libX11
    e2fsprogs
    libgpg-error
    glib
    gtk3
    gtk2
    libepoxy
    gdk-pixbuf
    libxml2
  ];
}
