{inputs, ...}: {
  imports = [
    inputs.gnil.homeModules.default
  ];

  programs.gnil = {
    enable = true;
    systemd.enable = true;
  };
}
