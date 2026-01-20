{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    unzip
    stow
    pre-commit
    xhost
    dpkg
    gitleaks
    kubectl
    kubecolor
    terraform
    ansible
  ];
}
