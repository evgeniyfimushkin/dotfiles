{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.keyd = {
    enable = true;

    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          brightnessdown = "f1";
          brightnessup = "f2";
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    evtest
    wtype
    wev
  ];
}
