{ config, lib, pkgs, ... }:

let
  myTheme = "Gruvbox-Dark";
in
{
  imports = [ ];

  home = {
    username = "eugene";
    homeDirectory = "/home/eugene";
    stateVersion = "25.11";
    sessionVariables = {};
    packages = with pkgs; [
        btop
    ];
  };

  gtk = {
    enable = true;
    theme = {
      name = myTheme;
      package = pkgs.gruvbox-gtk-theme; 
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  # Common theme for Hyprland / GNOME apps
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

  services.udiskie = {
      enable = true;
      settings = {
          # workaround for
          # https://github.com/nix-community/home-manager/issues/632
          program_options = {
              file_manager = "${pkgs.xfce.thunar}/bin/thunar";
          };
      };
  };

}
