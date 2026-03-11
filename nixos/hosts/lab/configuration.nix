{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/boot.nix
    ../../modules/common/cli.nix
    ../../modules/common/docker.nix
    ../../modules/common/dyn-libs.nix
    ../../modules/common/gpu.nix
    ../../modules/common/k3s.nix
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

    ../../modules/server/openssh.nix
  ];

  networking.hostName = "lab";
  system.stateVersion = "25.11";
}
