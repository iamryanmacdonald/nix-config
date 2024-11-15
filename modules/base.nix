{ myvars, nuenv, pkgs, ... }: {
  nixpkgs.overlays = [
    nuenv.overlays.default
  ];

  # auto upgrade nix to the unstable version
  # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/tools/package-management/nix/default.nix#L284
  nix.package = pkgs.nixVersions.latest;

  environment.systemPackages = with pkgs; [
    git # used by nix flakes

    # misc
    rsync
    which

    # networking tools
    curl
    dnsutils # `dig` + `nslookup`
    wget
  ];

  users.users.${myvars.username} = {
    description = myvars.userfullname;
  };

  nix.settings = {
    builders-use-substitutes = true;
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
    # substituers that will be considered before the official ones(https://cache.nixos.org)
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    # given the users in this list the right to specify additional substituters via:
    #    1. `nixConfig.substituers` in `flake.nix`
    #    2. command line args `--options substituers http://xxx`
    trusted-users = [myvars.username];
  };
}
