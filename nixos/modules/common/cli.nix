{ config, pkgs, ... }:
let
  my-kubernetes-helm =
    with pkgs;
    wrapHelm kubernetes-helm {
      plugins = with pkgs.kubernetes-helmPlugins; [
        helm-secrets
        helm-diff
        helm-s3
        helm-git
      ];
    };

  my-helmfile = pkgs.helmfile-wrapped.override {
    inherit (my-kubernetes-helm) pluginsDir;
  };
in
{
  environment.systemPackages = with pkgs; [
    ydotool
    cmatrix
    unzip
    stow # linking dotfiles
    pre-commit # pre-commit leaks check
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
    ccze # colorize output logs
    my-kubernetes-helm
    my-helmfile
    mdf2iso
    fuseiso
  ];
  programs.git.enable = true;
}
