{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        USB_AUTOSUSPEND = 1;

        WIFI_PWR_ON_BAT = "on";
        WIFI_PWR_ON_AC = "off";

        PCIE_ASPM_ON_BAT = "powersupersave";
        DISK_APM_LEVEL_ON_BAT = 128;
      };
    };

    power-profiles-daemon.enable = false;
  };
}
