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

    kernelParams = [
      "quiet"
      "loglevel=3"
      "udev.log_level=3"
    ];

    tmp.useTmpfs = false;
  };
}
