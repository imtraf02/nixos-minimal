{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix

    # System modules
    ../../modules/system/boot.nix
    ../../modules/system/network.nix
    ../../modules/system/hardware.nix
    ../../modules/system/locale.nix
    ../../modules/system/security.nix
    ../../modules/system/services.nix
    ../../modules/system/power.nix
    ../../modules/system/users.nix
    ../../modules/system/nix-ld.nix

    # Desktop modules
    ../../modules/desktop/niri.nix
    ../../modules/desktop/audio.nix
    ../../modules/desktop/fonts.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      (_final: prev: {
        # VTK 9.5.2 still expects GDAL metadata to be mutable, but GDAL 3.13
        # returns CSLConstList. Let the compiler infer the correct type.
        vtk = prev.vtk.overrideAttrs (oldAttrs: {
          postPatch =
            (oldAttrs.postPatch or "")
            + ''
              substituteInPlace IO/GDAL/vtkGDALRasterReader.cxx \
                --replace-fail "char** papszMetaData = GDALGetMetadata" "auto papszMetaData = GDALGetMetadata" \
                --replace-fail "char** papszMetadata = GDALGetMetadata" "auto papszMetadata = GDALGetMetadata"
            '';
        });
      })
    ];
  };

  networking.hostName = "nixos-laptop";

  system.stateVersion = "26.05";
}
