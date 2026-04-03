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

  systemd.tmpfiles.rules = [
    "Z /etc/rancher/k3s/k3s.yaml 640 ${config.my.username} ${config.my.username}"
    "L+ /home/${config.my.username}/.kube/k3s.yaml - ${config.my.username} ${config.my.username} - - /etc/rancher/k3s/k3s.yaml"
  ];
}
