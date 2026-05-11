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
      auto-optimise-store = true;
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";

  nixpkgs.config.allowUnfree = true;
}
