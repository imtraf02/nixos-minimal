{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix

    # System modules
    ../../modules/system/boot.nix
    ../../modules/system/network.nix
    ../../modules/system/hardware.nix
    ../../modules/system/locale.nix
    ../../modules/system/security.nix
    ../../modules/system/services.nix
    ../../modules/system/power.nix
    ../../modules/system/users.nix
    ../../modules/system/nix-ld.nix

    # Desktop modules
    ../../modules/desktop/niri.nix
    ../../modules/desktop/audio.nix
    ../../modules/desktop/fonts.nix
    ../../modules/desktop/portal.nix
  ];

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-laptop";

  system.stateVersion = "26.05";
}
