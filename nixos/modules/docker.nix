{ config, lib, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    docker-buildx
  ];
  users.groups.docker = {};
}
