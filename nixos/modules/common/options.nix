{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.my = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "eugene";
      description = "Main username for the system";
    };
    zshTheme = lib.mkOption {
      type = lib.types.str;
      default = "maran";
      description = "Zsh oh-my-zsh theme";
    };
  };
}
