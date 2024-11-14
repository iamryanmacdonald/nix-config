{
  description = "NixOS configuration of Ryan Macdonald";

  inputs = {
    impermanence.url = "github:nix-community/impermanence";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nuenv.url = "github:DeterminateSystems/nuenv";
  };

  outputs = inputs @ {
    nixos-hardware,
    nixpkgs,
    nuenv,
    ...
  }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        modules = [
          { networking.hostName = "laptop"; }

          ./configuration.nix

          ../modules/base.nix
          ../modules/nixos/base/i18n.nix
          ../modules/nixos/base/user-group.nix
          ../modules/nixos/base/networking.nix

          ../hosts/laptop/hardware-configuration.nix
          ../hosts/laptop/impermanence.nix
        ];
        specialArgs =
          inputs
          // {
            myvars.userfullname = "Ryan Macdonald";
            myvars.username = "ryan";
          };
        system = "x86_64-linux";
      };
    };
  };
}