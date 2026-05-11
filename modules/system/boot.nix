{
  config,
  pkgs,
  lib,
  ...
}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "intel_iommu=on"
      "iommu=pt"
      "mitigations=auto"
      "quiet"
      "splash"
      "loglevel=3"
      "udev.log_level=3"
    ];

    tmp.useTmpfs = true;
  };
}
