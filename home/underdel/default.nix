{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./packages.nix
  ];

  home = {
    username = "underdel";
    homeDirectory = "/home/underdel";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
