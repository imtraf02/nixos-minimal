{
  config,
  pkgs,
  lib,
  ...
}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
    ];
    config = {
      common.default = ["gtk"];
      niri = {
        default = lib.mkForce ["gnome"];
      };
    };
  };

  services.gnome.gnome-keyring.enable = true;
}
