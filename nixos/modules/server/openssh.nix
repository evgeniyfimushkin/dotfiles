{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.openssh = {
    enable = true;

    # SSH daemon settings
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      PubkeyAuthentication = true;
      AllowUsers = [ config.my.username ];
      Port = 22;
      MaxAuthTries = 3;
      LoginGraceTime = 60;
      ClientAliveInterval = 300;
      ClientAliveCountMax = 3;
      X11Forwarding = false;
      AllowTcpForwarding = true;
      GatewayPorts = "no";
    };

    # Public keys for users
    # Add your public keys here for key-based authentication
    extraConfig = ''
      # Additional SSH configuration if needed
    '';
  };

  # Add public keys to specific users
  users.users.${config.my.username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBL0N1eitl+UVpC2xQdftOJNUwHQ5YQom2TDcv7mn2aR eugene@nixos"
    ];
  };

  networking.firewall = {
    allowedTCPPorts = [ 22 ];
  };

  environment.systemPackages = with pkgs; [
    openssh
    sshfs
  ];
}
