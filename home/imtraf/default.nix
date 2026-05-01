{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./packages.nix
    ./shell.nix
    ./git.nix
    ./niri
    ./noctalia
    ./zen
    ./zed
    ./ghostty
    ./obs-studio
  ];

  home = {
    username = "imtraf";
    homeDirectory = "/home/imtraf";
    stateVersion = "26.05";
  };

  home.sessionVariables = {
    EDITOR = "zeditor";
    TERMINAL = "ghostty";
    TERM = "ghostty";
    BROWSER = "zen-beta";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
    XDG_DATA_HOME = "$HOME/.local/share";
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  programs.home-manager.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 16;
    };
  };

  # XDG user dirs
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;
    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
  };
}
