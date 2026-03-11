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
  };
}
