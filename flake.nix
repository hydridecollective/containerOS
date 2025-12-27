{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
    disko.url = "github:nix-community/disko";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
      disko,
      ...
    }:
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ./meta/default.nix
          ./system/default.nix
        ];
      };
    };
}
