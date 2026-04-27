{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # --- Terminal tools ---
    grc
    tmux
    zellij # Terminal multiplexer hiện đại (thay tmux, tùy thích)
    fzf # Fuzzy finder
    zoxide # Smart cd (z thay cho cd)
    ripgrep # rg — tìm kiếm nhanh
    fd # Thay thế find
    bat # Thay thế cat (syntax highlight)
    eza # Thay thế ls (icon, git status)
    delta # Better git diff
    duf # Better df (disk usage)
    dust # Better du
    procs # Better ps
    bottom # Better top (btm)
    fastfetch # System info đẹp
    ghostty

    # --- Archiving ---
    unzip
    p7zip
    unrar

    # --- System ---
    file
    lsof
    strace
    ltrace

    # --- Editor ---

    # --- Media ---
    mpv # Video player
    imv # Image viewer nhẹ cho Wayland
    spotify # (cần allowUnfree = true)

    # --- Development ---
    gcc
    gnumake
    python3
    nodejs_22
    rustup
    alejandra
    zed-editor

    # --- Misc ---
    xdg-utils
    wl-clipboard

    google-chrome
    app2unit
    biome
  ];
}
