{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;
  };

  xdg.configFile = {
    "ghostty/config" = {
      source = ./config/config;
    };
    "ghostty/themes/dracula" = {
      source = ./config/themes/dracula;
    };
  };
}
