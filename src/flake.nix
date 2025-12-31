{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    hydride-overlays = {
      url = "git+https://forge.hydride.dev/distro/nixpkgs-overlays.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        hydride-overlays.nixosModules.overlay
        ./meta/default.nix
        ./system/default.nix
      ];
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = systemModules;
      };

      defaultModules = systemModules;

      lib.mkHost =
        { system, modules }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = modules;
        };
    };
}
