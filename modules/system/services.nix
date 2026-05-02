{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [inputs.ling-sddm.nixosModules.default];
  services.displayManager.sddm.lingSDDM.enable = true;
  services.displayManager.sddm.lingSDDM.profileIcons = {
    imtraf = ../../assets/avatar/imtraf.jpg;
  };
  services.libinput.enable = true;

  environment.systemPackages = [
    pkgs.bibata-cursors
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];

  services = {
    # D-Bus — message bus cho desktop
    dbus = {
      enable = true;
      implementation = "broker";
    };

    # Greetd + tuigreet — display manager nhẹ, Wayland-native
    # greetd = {
    #   enable = true;
    #   settings.default_session = {
    #     command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
    #     user = "greeter";
    #   };
    # };

    displayManager.defaultSession = "niri";
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Ice";
          CursorSize = 24;
        };
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
