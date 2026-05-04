{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fish.enable = true;

  users.users.imtraf = {
    isNormalUser = true;
    description = "imtraf";
    shell = pkgs.fish;

    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "input"
      "bluetooth"
      "storage"
    ];
  };

  users.users.underdel = {
    isNormalUser = true;
    description = "underdel";
    initialHashedPassword = "$6$WZlkBfTCBJGvpWCe$2aCCNx5o1u3NOPB5E.JCJGNDe8s6mNPWrjcn5YkvwZToNJzo.PUQgky7Q1RvfzJiB..QMHmT206YSz.rw9VpU.";
    extraGroups = [
      "networkmanager"
      "audio"
      "video"
      "input"
      "bluetooth"
      "storage"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    btop
  ];
}
