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

  # GNOME Keyring — lưu mật khẩu / SSH key
  services.gnome.gnome-keyring.enable = true;

  # Mở khóa keyring khi đăng nhập qua greetd
  security.pam.services.greetd.enableGnomeKeyring = true;

  # RealtimeKit — ưu tiên realtime cho PipeWire (âm thanh ít lag)
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    polkit_gnome
    gnome-keyring
    libsecret # Secret Service API
    seahorse # GUI quản lý keyring / GPG
  ];
}
