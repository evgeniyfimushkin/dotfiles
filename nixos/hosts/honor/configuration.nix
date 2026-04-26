{
  config,
  lib,
  pkgs,
  ...
}:

let
  # Fix stale vendorHash in wg-feed upstream package
  wg-feed-overlay = final: prev: {
    wg-feed = prev.wg-feed.override {
      vendorHash = "sha256-WEjJl7EknFtMGIsiPVsZ6IuQ4UMal/jJhRKSg8MTFJg=";
    };
  };
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
  ];

  my.zshTheme = "maran";

  networking.hostName = "honor";
  system.stateVersion = "25.11";

  # Fix stale vendorHash in wg-feed upstream package (applied after upstream overlay)
  nixpkgs.overlays = lib.mkAfter [ wg-feed-overlay ];

  # wg-feed WireGuard subscription manager
  services.wg-feed = {
    enable = true;
    environmentFile = "/run/secrets/wg-feed.env";
    state_path = "/var/lib/wg-feed/state.json";
    logLevel = "info";

    feeds.main = {
      sync = {
        enabled = true;
        mode = "sse";
        polling.interval = 0;
        endpoints = [ "$SUBSCRIPTION_URL" ];
      };
      backends.default.type = "wg-quick";
    };
  };
}
