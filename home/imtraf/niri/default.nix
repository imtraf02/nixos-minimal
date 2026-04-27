{pkgs, ...}: {
  home.packages = with pkgs; [
    niri
    xwayland-satellite
    xdg-desktop-portal-wlr
    bibata-cursors
  ];

  xdg.configFile = {
    "niri" = {
      source = ./config;
      recursive = true;
    };
  };
}
