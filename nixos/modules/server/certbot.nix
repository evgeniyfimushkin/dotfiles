{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.certbot = {
    enable = true;
    agreeTerms = true;
  };
}
