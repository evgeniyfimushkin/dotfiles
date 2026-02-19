{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmatrix
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
    yq
    jq
    openssl
    dnsutils
    whois
    pstree
    mlocate
    tree
    nixfmt
    p7zip
    file
    unrar
    zip
    tmux
  ];
  programs.git.enable = true;
}
