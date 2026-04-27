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

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    btop
  ];
}
