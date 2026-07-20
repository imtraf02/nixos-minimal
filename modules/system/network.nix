{
  config,
  pkgs,
  lib,
  ...
}: {
  networking = {
    networkmanager.enable = true;
    modemmanager.enable = false;

    nftables.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
      trustedInterfaces = ["lo"];
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  environment.systemPackages = with pkgs; [
    iproute2
    nmap
  ];
}
