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

    # anyrun - a wayland launcher
    anyrun = {
      url = "github:Kirottu/anyrun";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryan4yin/ragenix";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    nuenv.url = "github:DeterminateSystems/nuenv";

    haumea = {
      url = "github:nix-community/haumea/v0.2.2";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur-ryan4yin.url = "github:ryan4yin/nur-packages";

    ########################  personal repositories  #########################################
    mysecrets = {
      url = "git+ssh://git@github.com/iamryanmacdonald/nix-secrets.git";

      flake = false;
    };
  };

  # the nixConfig here only affects the flake itself, not the system configuration!
  # for more information, see:
  #     https://nixos-and-flakes.thiscute.world/nix-store/add-binary-cache-servers
  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    extra-substituters = [
      "https://anyrun.cachix.org"
    ];
    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
  };

  outputs = inputs: import ./outputs inputs;
}
