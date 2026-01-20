# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/cmatrix.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "tcp_bbr" "tun" ];
  boot.kernel.sysctl = {
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
    "net.ipv6.conf.default.forwarding" = 1;
    
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_notsent_lowat" = 16384;
    # Дополнительные настройки для лучшей работы VPN
    "net.ipv4.conf.all.rp_filter" = 0;
    "net.ipv4.conf.default.rp_filter" = 0;
    "net.ipv4.conf.tun0.rp_filter" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
  };

  # networking.hostName = "nixos"; # Define your hostname.
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  networking.extraHosts = ''
45.155.204.190 chatgpt.com
95.182.120.241 chatgpt.com
45.155.204.190 ab.chatgpt.com
95.182.120.241 ab.chatgpt.com
45.155.204.190 gpt3-openai.com
95.182.120.241 gpt3-openai.com
45.155.204.190 operator.chatgpt.com
95.182.120.241 operator.chatgpt.com
45.155.204.190 sora.chatgpt.com
95.182.120.241 sora.chatgpt.com
45.155.204.190 webrtc.chatgpt.com
95.182.120.241 webrtc.chatgpt.com
45.155.204.190 www.chatgpt.com
95.182.120.241 www.chatgpt.com
  '';
  # Set your time zone.
  time.timeZone = "Asia/Novosibirsk";
      services.logind = {
    lidSwitch = "ignore"; # или "lock" для блокировки экрана без сна
    lidSwitchExternalPower = "ignore";
    lidSwitchDocked = "ignore";
    
  };
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
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  users.groups.tun = {};
  users.users.eugene = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ 
      "wheel" 
      "networkmanager"
      "tun"
      "docker"
    ]; # Enable ‘sudo’ for the user.

  # Создайте группу tun и добавьте пользователя
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
    libepoxy
    gdk-pixbuf
    libxml2
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
    unzip
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
    htop
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
    (python3.withPackages (subpkgs: with subpkgs; [ requests ]))
    pre-commit
    obsidian
    networkmanagerapplet
    brightnessctl
    webcord
    teamspeak6-client
    wireshark
    traceroute
    tcpdump
    xhost
    wireguard-tools
    lsof
    xray
    sing-box
    v2rayn
    gitleaks
  ];
  programs.xfconf.enable = true;
  programs.thunar.enable = true;

  programs.steam = {
    enable = true;
  };
  programs.appimage.enable = true;
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [
      pkgs.libepoxy
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
  networking.firewall.enable = false;

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

