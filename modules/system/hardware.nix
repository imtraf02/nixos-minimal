{
  config,
  pkgs,
  lib,
  ...
}: {
  hardware = {
    enableRedistributableFirmware = true;
    i2c.enable = true;

    cpu.intel.updateMicrocode = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true; # Battery level indicator, v.v.
      };
    };

    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime # OpenCL for Intel Gen12+ (Tiger Lake)
        vpl-gpu-rt
      ];
    };
  };

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    usbutils
    pciutils
    lshw
    smartmontools
  ];
}
