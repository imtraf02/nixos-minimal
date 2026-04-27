{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["vmd" "xhci_pci" "ahci" "nvme" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ff43d378-f5c0-4f97-bb64-9b6b1ce124f8";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/14C4-2785";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  fileSystems."/var/lib/docker/rootfs/overlayfs/b286da98e1a58c6eb1210ecacdfb17b62a5b46d665c3aa74a3fe2eb8b219ab4b" = {
    device = "overlay";
    fsType = "overlay";
  };

  fileSystems."/var/lib/docker/rootfs/overlayfs/62f084f87e78207c6dc8f712304ee215067e152c7551aebd73d65b0dbae51bf0" = {
    device = "overlay";
    fsType = "overlay";
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
