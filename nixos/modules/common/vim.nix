{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    ripgrep
    fd
    fzf

    rust-analyzer
  ];
  programs.vim.enable = true;
}
