{
  config,
  lib,
  pkgs,
  ...
}:
{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  nix.optimise.automatic = true;
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    max-jobs = "auto"; # Использовать все ядра
    cores = 0;
  };
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 10d";
  };
}
