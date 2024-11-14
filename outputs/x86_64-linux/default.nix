{ inputs, lib, ... } @ args: let
  inherit (inputs) haumea;

  # Contains all the flake outpts of this system architecture.
  data = haumea.lib.load {
    inputs = args;
    src = ./src;
  };
  # nix file names are redundant, weo we remove them
  dataWithoutPaths = builtins.attrValues data;

  # Merge all the machine's data into a single attribute set.
  outputs = {
    nixosConfigurations = lib.attrsets.mergeAttrsList (map (it: it.nixosConfigurations or {}) dataWithoutPaths);
    packages = lib.attrsets.mergeAttrsList (map (it: it.packages or {}) dataWithoutPaths);
  };
in
  outputs
  // {
    inherit data; # for debugging purposes
  }
