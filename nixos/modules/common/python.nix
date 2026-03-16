{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    uv
    (python3.withPackages (
      ps: with ps; [
        requests
        flask
      ]
    ))
  ];
}
