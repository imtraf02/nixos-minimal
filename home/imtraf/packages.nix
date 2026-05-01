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

    # --- Terminal tools ---
    ghostty
    zellij # Terminal multiplexer
    fzf # Fuzzy finder
    zoxide # Smart cd
    grc # Generic colouriser

    # --- File & search ---
    ripgrep # rg — tìm kiếm nhanh
    fd # Thay thế find
    bat # Thay thế cat (syntax highlight)
    eza # Thay thế ls (icon, git status)

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

    # --- Development: editors & tools ---
    zed-editor
    alejandra # Nix formatter
    biome
    gemini-cli

    # --- Misc ---
    xdg-utils
    wl-clipboard
    google-chrome
    app2unit
  ];
}
