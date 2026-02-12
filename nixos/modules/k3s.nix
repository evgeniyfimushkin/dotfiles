{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.k3s = {
    enable = true;
    role = "server";
  };

  # systemd.services."k3s".enable = false;
}
