{
  config,
  pkgs,
  lib,
  ...
}: {
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };

  security.polkit.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = ["graphical-session.target"];
    wants = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
    };
  };

  services.gnome.gnome-keyring.enable = true;

  security.pam.services.greetd.enableGnomeKeyring = true;

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    polkit_gnome
    gnome-keyring
    libsecret
    seahorse
  ];
}
