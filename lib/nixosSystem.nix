{ genSpecialArgs, inputs, lib, myvars, nixos-modules, system, homeModules ? [], specialArgs ? (genSpecialArgs system), ... }: let
  inherit (inputs) nixpkgs;
in
  nixpkgs.lib.nixosSystem {
    inherit specialArgs system;
    modules =
      nixos-modules;
  }
