{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    cmatrix
    wget
    networkmanagerapplet
    traceroute
    tcpdump
    inetutils
    lsof
    xray
    sing-box
    wireguard-tools
    wireshark
  ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [
    "tcp_bbr"
    "tun"
  ];
  boot.kernel.sysctl = {
    # turn this shit faster
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
    "net.ipv6.conf.default.forwarding" = 1;

    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_notsent_lowat" = 16384;
    "net.ipv4.conf.all.rp_filter" = 0;
    "net.ipv4.conf.default.rp_filter" = 0;
    "net.ipv4.conf.tun0.rp_filter" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
  };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.ssh.startAgent = true;

  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # red flag
  networking.firewall.enable = false;

  networking.extraHosts = ''
    45.155.204.190 chatgpt.com
    95.182.120.241 chatgpt.com
    45.155.204.190 ab.chatgpt.com
    95.182.120.241 ab.chatgpt.com
    45.155.204.190 gpt3-openai.com
    95.182.120.241 gpt3-openai.com
    45.155.204.190 operator.chatgpt.com
    95.182.120.241 operator.chatgpt.com
    45.155.204.190 sora.chatgpt.com
    95.182.120.241 sora.chatgpt.com
    45.155.204.190 webrtc.chatgpt.com
    95.182.120.241 webrtc.chatgpt.com
    45.155.204.190 www.chatgpt.com
    95.182.120.241 www.chatgpt.com
  '';
}
