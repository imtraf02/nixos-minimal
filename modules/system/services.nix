{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.ling-sddm.nixosModules.default
  ];

  services = {
    libinput.enable = true;

    dbus = {
      enable = true;
      implementation = "broker";
    };

    displayManager = {
      defaultSession = "niri";

      sddm = {
        enable = true;
        wayland.enable = true;

        ling-sddm = {
          enable = true;
          profileIcons = {
            imtraf = ../../assets/avatar/imtraf.jpg;
            underdel = ../../assets/avatar/underdel.jpg;
          };
        };

        settings.Theme = {
          CursorTheme = "Bibata-Modern-Ice";
          CursorSize = 24;
        };
      };
    };

    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandlePowerKey = "suspend";
      IdleAction = "suspend";
      IdleActionSec = "15min";
    };
  };

  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = false;
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "Sun 14:00";
      options = "--delete-older-than 14d";
      randomizedDelaySec = "1h";
      persistent = true;
    };

    optimise = {
      automatic = true;
      dates = "Sun 16:00";
      randomizedDelaySec = "1h";
      persistent = true;
    };
  };

  systemd.services.nix-gc = {
    unitConfig.ConditionACPower = true;
    serviceConfig = {
      Nice = 19;
      CPUSchedulingPolicy = "idle";
      IOSchedulingClass = "idle";
    };
  };

  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
