{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [inputs.zen-browser.homeModules.beta];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    profiles.default.settings = {
      browser = {
        tabs.allow_transparent_browser = true;
      };
    };
  };
}
