# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Novosibirsk";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      roboto  # Для UI элементов
      roboto-mono  # Альтернативный моноширинный
      fira-code  # Красивый шрифт с лигатурами
      fira-code-symbols  # Символы для Fira Code
      inter  # Современный sans-serif
      noto-fonts  # Для поддержки всех языков
      noto-fonts-color-emoji
      source-han-sans  # Азиатские символы
    ];
    
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Roboto" "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };
 

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.flatpak = {
    enable = true;
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";
  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh = {
	enable = true;
    	#enableCompletion = true;
    	#autosuggestions.enable = true;  # автоматические подсказки
    	#syntaxHighlighting.enable = true;
	ohMyZsh = {
		enable = true;
		plugins = [ "git" "docker" "sudo" ];
		theme = "maran";
	};
  
	
  };
  users.users.eugene = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ 
      "wheel" 
      "networkmanager"
      "docker"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
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
  ];
  programs.firefox.enable = true;
  programs.hyprland = {
	  enable = true;
	  package = pkgs.hyprland;
    xwayland.enable = true;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim     
    vscodium
    pavucontrol
    wget
    kitty
    wofi
    git
    stow
    zsh
    waybar
    mako
    fastfetch
    steam-run
    dpkg
    telegram-desktop
    wl-clipboard
    cliphist
    anki-bin
    hyprlock
    hyprpaper
    hyprsunset
    hyprpicker
    hyprcursor
    hyprshot
    grim
    slurp
    blueman
    playerctl
    mpv
    thunar
    (python3.withPackages (subpkgs: with subpkgs; [ requests ]))
    obsidian
    networkmanagerapplet
    brightnessctl
    webcord
    teamspeak6-client
    wireshark
    tcpdump
    home-manager
    xhost
  ];

  programs.steam = {
    enable = true;
  };
  programs.appimage.enable = true;
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [
      # missing libraries here, e.g.: `pkgs.libepoxy`
    ];
  };
  programs.appimage.binfmt = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

}

