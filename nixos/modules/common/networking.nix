{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
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
    iperf3
    # haguichi
  ];
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
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = true;
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

  # services.logmein-hamachi.enable = true;
  networking.extraHosts = "";
}
