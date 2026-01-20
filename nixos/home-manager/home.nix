{ config, lib, pkgs, ... }:

let
  myTheme = "Catppuccin-Mocha-Standard-Blue-Dark";
in
{
  imports = [ ];

  home = {
    username = "eugene";
    homeDirectory = "/home/eugene";
    stateVersion = "25.11";
    sessionVariables = {
    };
    packages = with pkgs; [
        btop
    ];
  };

  gtk = {
    enable = true;
    theme = {
      name = myTheme;
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  # Common theme on hyprland
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = myTheme;
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = myTheme;
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";  
    style = {
      name = "kvantum";
    };
  };
  
  xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
    General.theme = myTheme;
  };

}
