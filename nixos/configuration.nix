{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/automount.nix
    ./modules/battery.nix
    ./modules/bluetooth.nix
    ./modules/boot.nix
    ./modules/browser.nix
    ./modules/cli.nix
    ./modules/docker.nix
    ./modules/dyn-libs.nix
    ./modules/flatpak.nix
    ./modules/fonts.nix
    ./modules/gpu.nix
    ./modules/gui.nix
    ./modules/hyprland.nix
    ./modules/k3s.nix
    # ./modules/kde.nix
    ./modules/keyboard.nix
    ./modules/locale.nix
    ./modules/media.nix
    ./modules/monitoring.nix
    ./modules/networking.nix
    ./modules/nix.nix
    ./modules/nixpkgs.nix
    ./modules/obsidian-sync.nix
    ./modules/printing.nix
    ./modules/python.nix
    ./modules/ssd.nix
    ./modules/tpm.nix
    ./modules/user.nix
    ./modules/vim.nix
    ./modules/vscodium.nix
    # ./modules/wine.nix
    ./modules/zsh.nix
  ];

  system.stateVersion = "25.11";
}
