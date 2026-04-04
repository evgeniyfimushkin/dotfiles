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
      theme = config.my.zshTheme;
    };
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/dotfiles/nixos#${config.networking.hostName}";
      nrb = "sudo nixos-rebuild build --flake ~/dotfiles/nixos#${config.networking.hostName}";
      nrt = "sudo nixos-rebuild test --flake ~/dotfiles/nixos#${config.networking.hostName}";
      nrg = "sudo nix-collect-garbage -d";
      nfu = "sudo nix flake update --flake ~/dotfiles/nixos";
    };
  };
}
