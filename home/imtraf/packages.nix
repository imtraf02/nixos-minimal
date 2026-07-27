{
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  home.packages = with pkgs; [
    # --- Antigravity ---
    inputs.antigravity-nix.packages.${system}.google-antigravity-ide
    inputs.codex-cli-nix.packages.${system}.default
    opencode
    telegram-desktop
    # --- Terminal tools ---
    zellij # Terminal multiplexer
    fzf # Fuzzy finder
    zoxide # Smart cd
    grc # Generic colouriser
    # --- File & search ---
    ripgrep # rg — tìm kiếm nhanh
    fd # Thay thế find
    bat # Thay thế cat (syntax highlight)
    eza # Thay thế ls (icon, git status)
    yazi # File manager
    # --- Disk & process ---
    duf # Better df (disk usage)
    dust # Better du
    procs # Better ps
    bottom # Better top (btm)
    # --- Git ---
    delta # Better git diff
    # --- System info & debug ---
    fastfetch
    file
    lsof
    strace
    ltrace
    # --- Archiving ---
    unzip
    p7zip
    unrar
    # --- Media ---
    mpv # Video player
    imv # Image viewer nhẹ cho Wayland
    spotify # (cần allowUnfree = true)

    # --- Misc ---
    xdg-utils
    wl-clipboard
    app2unit
    # --- Media & video editing ---
    davinci-resolve

    nodejs
    freecad
  ];

  xdg.desktopEntries.davinci-resolve = {
    name = "DaVinci Resolve";
    exec = "env QT_QPA_PLATFORM=xcb davinci-resolve %u";
    icon = "davinci-resolve";
    categories = ["AudioVideo"];
  };
}
