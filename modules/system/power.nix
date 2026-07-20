{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    upower.enable = true;

    power-profiles-daemon.enable = true;
    thermald.enable = true;

    tlp.enable = false;
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    priority = 100;
  };
}
