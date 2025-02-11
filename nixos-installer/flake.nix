{
  description = "NixOS configuration of Ryan Macdonald";

  inputs = {
    impermanence.url = "github:nix-community/impermanence";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nuenv.url = "github:DeterminateSystems/nuenv";
  };

  outputs = inputs @ {
    nixos-hardware,
    nixpkgs,
    nuenv,
    ...
  }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        modules = [
          {networking.hostName = "desktop";}

          ./configuration.nix

          ../modules/base.nix
          ../modules/nixos/base/i18n.nix
          ../modules/nixos/base/user-group.nix
          ../modules/nixos/base/networking.nix

          ../hosts/desktop/hardware-configuration.nix
          ../hosts/desktop/impermanence.nix
        ];
        specialArgs =
          inputs
          // {
            myvars.userfullname = "Ryan Macdonald";
            myvars.username = "ryan";
          };
        system = "x86_64-linux";
      };
      laptop = nixpkgs.lib.nixosSystem {
        modules = [
          {networking.hostName = "laptop";}

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
