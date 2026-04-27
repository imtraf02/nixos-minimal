{
  config,
  pkgs,
  lib,
  ...
}: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf

      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.symbols-only
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
        monospace = ["JetBrainsMono Nerd Font"];
        emoji = ["Noto Color Emoji"];
      };
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel.rgba = "rgb";
    };
  };
}
