{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    # D-Bus — message bus cho desktop
    dbus = {
      enable = true;
      implementation = "broker";
    };

    # Greetd + tuigreet — display manager nhẹ, Wayland-native
    greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
        user = "greeter";
      };
    };

    # Logind — power button, lid switch
    logind = {
      settings.Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "suspend";
        HandlePowerKey = "suspend";
        IdleAction = "suspend";
        IdleActionSec = "15min";
      };
    };
  };

  # Nix daemon settings
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      warn-dirty = false;
    };

    # Tự động dọn dẹp store cũ
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };

  nixpkgs.config.allowUnfree = true;
}
