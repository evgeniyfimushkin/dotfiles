{
  config,
  lib,
  pkgs,
  ...
}:

let
  _ = 0; # placeholder
in

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/boot.nix
    ../../modules/common/cli.nix
    ../../modules/common/docker.nix
    ../../modules/common/dyn-libs.nix
    ../../modules/common/gpu.nix
    ../../modules/common/keyboard.nix
    ../../modules/common/locale.nix
    ../../modules/common/monitoring.nix
    ../../modules/common/networking.nix
    ../../modules/common/nix.nix
    ../../modules/common/nixpkgs.nix
    ../../modules/common/options.nix
    ../../modules/common/python.nix
    ../../modules/common/shell-compat.nix
    ../../modules/common/ssd.nix
    ../../modules/common/user.nix
    ../../modules/common/vim.nix
    ../../modules/common/zsh.nix

    ../../modules/desktop/automount.nix
    ../../modules/desktop/battery.nix
    ../../modules/desktop/bluetooth.nix
    ../../modules/desktop/browser.nix
    ../../modules/desktop/flatpak.nix
    ../../modules/desktop/fonts.nix
    ../../modules/desktop/gui.nix
    ../../modules/desktop/hyprland.nix
    # ../../modules/desktop/kde.nix
    ../../modules/desktop/k3s.nix
    ../../modules/desktop/media.nix
    ../../modules/desktop/obsidian-sync.nix
    ../../modules/desktop/printing.nix
    ../../modules/desktop/tpm.nix
    ../../modules/desktop/vscodium.nix
    # ../../modules/desktop/wine.nix
    ../../modules/desktop/happ-nixos/happ-module.nix
  ];

  my.zshTheme = "maran";

  networking.hostName = "honor";
  system.stateVersion = "25.11";

  # Explicitly keep standard dbus to prevent unwanted switch to dbus-broker
  services.dbus.implementation = "dbus";
  services.happ.enable = true;

  services.wg-feed = {
    enable = true;
    # Upstream pins Go 1.25, which current nixpkgs no longer provides.
    package = pkgs.wg-feed.override { go_1_25 = pkgs.go; };
    # Keep the subscription URL and its key outside Git and the Nix store.
    environmentFile = "/etc/wg-feed/subscription.env";

    feeds.main = {
      sync = {
        enabled = true;
        mode = "polling";
        endpoints = [ "$SUBSCRIPTION_URL" ];
      };
      backends.default.type = "wg-quick";
    };
  };
}
