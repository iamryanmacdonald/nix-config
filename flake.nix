{
  description = "Ryan Macdonald's nix configuration for NixOS";

  inputs = {
    # Official NixOS package source, using NixOS' unstable branch by default.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nuenv.url = "github:DeterminateSystems/nuenv";

    haumea = {
      url = "github:nix-community/haumea/v0.2.2";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur-ryan4yin.url = "github:ryan4yin/nur-packages";
  };

  outputs = inputs: import ./outputs inputs;
}
