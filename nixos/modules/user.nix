{
  config,
  lib,
  pkgs,
  ...
}:
{
  users.groups.tun = { };
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
}
