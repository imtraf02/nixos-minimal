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
    ./zen
    ./zed
    ./ghostty
    ./obs-studio
    inputs.ling-shell.homeModules.default
    inputs.gnil-fm.homeManagerModules.default
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
    GTK_USE_PORTAL = "1";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
    XDG_DATA_HOME = "$HOME/.local/share";
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  programs.home-manager.enable = true;

  programs.ling-shell = {
    enable = true;
    systemd.enable = true;
    extraRuntimePackages = with pkgs; [
      ddcutil
      mpvpaper
    ];
    package =
      inputs.ling-shell.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs
      (oldAttrs: {
        # Keep stale local build artifacts out of the upstream source archive.
        src = lib.cleanSourceWith {
          src = oldAttrs.src;
          filter = path: _type:
            !(builtins.elem (builtins.baseNameOf path) [
              "result"
              "undefinednetwork_stats.json"
            ]);
        };
      });
  };

  programs.gnil-fm = {
    enable = true;
    defaultFileManager = true;
    portal.enable = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["gnil-fm.desktop"];
      "x-scheme-handler/file" = ["gnil-fm.desktop"];
    };
    associations.added = {
      "inode/directory" = ["gnil-fm.desktop"];
      "x-scheme-handler/file" = ["gnil-fm.desktop"];
      "x-scheme-handler/tg" = ["org.telegram.desktop.desktop"];
      "x-scheme-handler/tonsite" = ["org.telegram.desktop.desktop"];
    };
  };
  xdg.configFile."mimeapps.list".force = true;

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
