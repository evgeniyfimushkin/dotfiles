{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        ms-python.python
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        shd101wyy.markdown-preview-enhanced
        vscodevim.vim
        hashicorp.terraform
        ms-kubernetes-tools.vscode-kubernetes-tools
        golang.go
        redhat.vscode-yaml
        redhat.ansible
        rooveterinaryinc.roo-cline
        eamodio.gitlens
        gitlab.gitlab-workflow
        github.vscode-github-actions
        jdinhlife.gruvbox
        samuelcolvin.jinjahtml
        humao.rest-client
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "remote-ssh-edit";
          publisher = "ms-vscode-remote";
          version = "0.47.2";
          sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
        }
        
      ];
    })

  ];  
}
