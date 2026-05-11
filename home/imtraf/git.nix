{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;

    settings = {
      user.name = "imtraf02";
      user.email = "imtrafdev@gmail.com";

      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "hx";
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";
    };

    ignores = [
      ".cache/"
      ".direnv/"
      "node_modules"

      ".DS_Store"
      ".idea"
      "*.swp"
      "*.elc"
    ];
  };
}
