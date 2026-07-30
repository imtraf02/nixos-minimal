{pkgs, ...}: {
  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
    xwayland.enable = true;
    dconf.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
