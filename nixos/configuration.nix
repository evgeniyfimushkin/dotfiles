{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/hyprland.nix
      ./modules/networking.nix
      ./modules/fonts.nix
      ./modules/dyn-libs.nix
      ./modules/bluetooth.nix
      ./modules/media.nix
      ./modules/docker.nix
      ./modules/zsh.nix
      ./modules/cli.nix
      ./modules/gui.nix
      ./modules/vscodium.nix
      ./modules/python.nix
      ./modules/flatpak.nix
    ];

  time.timeZone = "Asia/Novosibirsk";

  # for ignoring laptop lid closing
  services.logind = {
    lidSwitch = "ignore"; 
    lidSwitchExternalPower = "ignore";
    lidSwitchDocked = "ignore";
  };

  services.printing.enable = true;

  services.libinput.enable = true;

  users.groups.tun = {};
  users.users.eugene = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ 
      "wheel" 
      "networkmanager"
      "tun"
      "docker"
    ]; 
  };

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "25.11";
}

