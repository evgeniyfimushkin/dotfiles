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

    ssh = {
      theme = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "SSH theme name";
      };
    };
  };
}
