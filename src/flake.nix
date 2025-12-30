{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    hydride-overlays.url = "git+https://forge.hydride.dev/infrastructure/nixpkgs-overlays.git";
    disko.url = "github:nix-community/disko";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
      nixos-generators,
      hydride-overlays,
      disko,
      ...
    }:
    let
      systemModules = [
        disko.nixosModules.disko
        ./meta/default.nix
        ./system/default.nix
      ];
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = systemModules;
      };

      nixosConfigurations.live = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./meta/default.nix
          ./images/live/default.nix
        ];
      };

      nixosConfigurations.minimal = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./meta/default.nix
          ./images/minimal/default.nix
        ];
      };
    };
}
