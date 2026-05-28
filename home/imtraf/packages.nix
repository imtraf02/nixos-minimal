{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # --- Antigravity ---
    inputs.antigravity-nix.packages.${pkgs.system}.default
    inputs.codex-cli-nix.packages.${pkgs.system}.default
    opencode
    telegram-desktop

    # --- Terminal tools ---
    ghostty
    zellij # Terminal multiplexer
    fzf # Fuzzy finder
    zoxide # Smart cd
    grc # Generic colouriser
    termius
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
    # --- Development: languages & runtimes ---
    gcc
    gnumake
    python3
    nodejs_24
    bun
    pnpm
    rustup
    go

    # --- Development: editors & tools ---
    zed-editor
    alejandra # Nix formatter
    gemini-cli
    # --- Misc ---
    xdg-utils
    wl-clipboard
    app2unit
    # --- Media & video editing ---
    davinci-resolve

    nautilus
  ];

  xdg.desktopEntries.davinci-resolve = {
    name = "DaVinci Resolve";
    exec = "env QT_QPA_PLATFORM=xcb davinci-resolve %u";
    icon = "davinci-resolve";
    categories = ["AudioVideo"];
  };
}
