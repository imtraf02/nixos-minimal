{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    fcitx5-lotus = {
      url = "github:LotusInputMethod/fcitx5-lotus";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ling-sddm = {
      url = "github:imtraf02/ling-sddm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    overlays = [
      (final: prev: {
        unstable = nixpkgs-unstable.legacyPackages.${system};
      })
    ];

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = overlays;
    };
  in {
    nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
      };

      modules = [
        {nixpkgs = {inherit (pkgs) config overlays;};}

        ./hosts/laptop/default.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users = {
              imtraf = import ./home/imtraf/default.nix;
              underdel = import ./home/underdel/default.nix;
            };
          };
        }
      ];
    };
  };
}
