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

        # Giới hạn sạc pin — bỏ comment nếu laptop hỗ trợ (ThinkPad, một số Dell/HP)
        # START_CHARGE_THRESH_BAT0 = 20;
        # STOP_CHARGE_THRESH_BAT0  = 80;

        USB_AUTOSUSPEND = 1;

        # WiFi power save khi dùng pin
        WIFI_PWR_ON_BAT = "on";
        WIFI_PWR_ON_AC = "off";

        # NVMe / SATA power management
        PCIE_ASPM_ON_BAT = "powersupersave";
        DISK_APM_LEVEL_ON_BAT = 128;
      };
    };

    power-profiles-daemon.enable = false;
  };
}
