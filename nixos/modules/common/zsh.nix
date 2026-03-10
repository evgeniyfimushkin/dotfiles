{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    #enableCompletion = true;
    #autosuggestions.enable = true;
    #syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "sudo"
      ];
      theme = "maran";
    };
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/dotfiles/nixos#${config.networking.hostName} --upgrade";
      nrb = "sudo nixos-rebuild build --flake ~/dotfiles/nixos#${config.networking.hostName} --upgrade";
      nrt = "sudo nixos-rebuild test --flake ~/dotfiles/nixos#${config.networking.hostName} --upgrade";
    };
  };
}
