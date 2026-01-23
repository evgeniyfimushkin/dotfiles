{ config, lib, pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    docker-buildx
  ];
  users.groups.docker = {};
}
