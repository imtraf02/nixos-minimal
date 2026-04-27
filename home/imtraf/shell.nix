{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
    ];

    # Aliases tiện lợi
    shellAliases = {
      cls = "clear";
      ls = "eza --icons";
      ll = "eza -la --icons --git";
      lt = "eza --tree --icons -L 2";
      cat = "bat";
      cd = "z"; # zoxide thay cd
      top = "btm"; # bottom thay top
      df = "duf";
      du = "dust";

      # NixOS shortcuts
      nrs = "sudo nixos-rebuild switch --flake ~/.config/nixos#nixos-laptop";
      nrt = "sudo nixos-rebuild test --flake ~/.config/nixos#nixos-laptop";
      nfu = "nix flake update ~/.config/nixos";
      ngc = "sudo nix-collect-garbage -d";
    };

    # Khởi tạo zoxide trong fish
    interactiveShellInit = ''
      zoxide init fish | source
      set -gx fish_greeting ""   # Tắt lời chào mặc định của fish
    '';
  };

  # Starship prompt — đẹp, nhanh
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$git_status$nix_shell$cmd_duration$line_break$character";
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
      directory = {
        style = "bold blue";
        truncation_length = 3;
      };
      git_branch.symbol = " ";
      nix_shell.symbol = "❄ ";
      nix_shell.style = "bold cyan";
      cmd_duration.min_time = 2000; # Hiện thời gian chạy nếu > 2 giây
    };
  };

  # Direnv — tự động load .envrc khi vào thư mục
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true; # Tích hợp tốt với Nix flakes
  };
}
