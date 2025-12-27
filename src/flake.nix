{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    disko.url = "github:nix-community/disko";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
      nixos-generators,
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
        modules = [ ./images/live/default.nix ];
      };

      nixosConfigurations.minimal = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./images/minimal/default.nix ];
      };
    };
}
