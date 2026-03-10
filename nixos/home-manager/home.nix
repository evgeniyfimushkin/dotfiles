{
  config,
  lib,
  pkgs,
  ...
}:
{
  home = {
    username = "eugene";
    homeDirectory = "/home/eugene";
    stateVersion = "25.11";
    sessionVariables = { };
    packages = with pkgs; [
      btop
    ];
  };
}
