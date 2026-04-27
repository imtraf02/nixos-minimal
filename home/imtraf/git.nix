{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;

    settings = {
      user.name = "imtraf";
      user.email = "your@email.com";

      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "hx";
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";

      aliases = {
        ci = "commit";
        co = "checkout";
        s = "status";
      };
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
