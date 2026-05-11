{inputs, ...}: {
  imports = [
    inputs.lingfm.homeModules.default
  ];

  programs.lingfm = {
    enable = true;
    defaultFileManager = true;
  };
}
