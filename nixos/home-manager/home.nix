{ config, lib, pkgs, ... }:

{
  imports = [ ];

  home = {
    username = "eugene";
    homeDirectory = "/home/eugene";
    stateVersion = "25.11";
    packages = with pkgs; [
        btop
        vscodium
        foliate
    ];


    # pointerCursor = {
    #   # package = pkgs.vanilla-dmz;
    #   # name = "Vanilla-DMZ";
    #   # package = pkgs.catppuccin-cursors.mochaLight;
    #   # name = "Catppuccin-Mocha-Light-Cursors";
    #   size = 24;
    #   gtk.enable = true;
    #   x11 = {
    #     enable = true;
    #     defaultCursor = true;
    #   };
    # };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
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
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };    
    gtk4 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
      color-scheme = "prefer-dark";
    };

    # For Gnome shell
    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
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
    General.theme = "Catppuccin-Mocha-Blue";
  };
}
