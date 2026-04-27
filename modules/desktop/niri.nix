{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.niri.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
  };

  programs.xwayland.enable = true;

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [];
}
