{
  config,
  pkgs,
  lib,
  ...
}: {
  hardware = {
    enableRedistributableFirmware = true;
    enableAllFirmware = true;

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
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime # OpenCL for Intel Gen12+ (Tiger Lake)
        vpl-gpu-rt
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };

  services.blueman.enable = true;

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    usbutils
    pciutils
    lshw
    smartmontools
  ];
}
