{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;

    settings = {
      bar = {
        barType = "framed";
        position = "top";
      };
    };
  };
}
