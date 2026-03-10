{
  config,
  lib,
  pkgs,
  ...
}:
{
  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    docker-buildx
  ];
  users.groups.docker = { };
}
