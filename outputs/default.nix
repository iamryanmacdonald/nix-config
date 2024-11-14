{ nixpkgs, ... } @ inputs: let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib { inherit lib; };
  myvars = import ../vars { inherit lib; };

  # Add my custom lib, vars, nixpkgs instance, and all the inputs to specialArgs,
  # so that I can use them in all my nixos/home-manager/darwin modules.
  genSpecialArgs = system:
    inputs
    // {
      inherit mylib myvars;

      # use unstable branch for some packages to get the latest updates
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;

	config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;

	config.allowUnfree = true;
      };
    };

  # these are the args for all the haumea modules in this folder.
  args = { inherit genSpecialArgs inputs lib mylib myvars; };

  # modules for each supported system
  nixosSystems = {
    x86_64-linux = import ./x86_64-linux (args // { system = "x86_64-linux"; });
  };
  darwinSystems = {};
  allSystems = nixosSystems // darwinSystems;
  allSystemNames = builtins.attrNames allSystems;
  nixosSystemValues = builtins.attrValues nixosSystems;

  # Helper function to generate a set of attributes for each system
  forAllSystems = func: (nixpkgs.lib.genAttrs allSystemNames func);
in {
  # Add attribute sets into outputs, for debugging
  debugAttrs = { inherit nixosSystems nixosSystemValues darwinSystems allSystems allSystemNames; };

  # NixOS Hosts
  nixosConfigurations = lib.attrsets.mergeAttrsList (map (it: it.nixosConfigurations) nixosSystemValues);
}
