{
  genSpecialArgs,
  inputs,
  lib,
  myvars,
  nixos-modules,
  system,
  home-modules ? [],
  specialArgs ? (genSpecialArgs system),
  ...
}: let
  inherit (inputs) home-manager nixpkgs;
in
  nixpkgs.lib.nixosSystem {
    inherit specialArgs system;
    modules =
      nixos-modules
      ++ (
        lib.optionals ((lib.lists.length home-modules) > 0)
        [
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "home-manager.backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users."${myvars.username}".imports = home-modules;
          }
        ]
      );
  }
