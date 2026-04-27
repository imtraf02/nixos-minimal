{
  config,
  pkgs,
  lib,
  ...
}: {
  networking = {
    networkmanager.enable = true;

    nftables.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
      trustedInterfaces = ["lo"];
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    iproute2
    wirelesstools
    nmap
  ];
}
