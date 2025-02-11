{myvars, ...}: let
  hostName = "desktop";
in {
  imports = [
    ./hardware-configuration.nix

    ./impermanence.nix
  ];

  networking = {
    inherit hostName;
    inherit (myvars.networking) nameservers;

    # desktop needs a CLI for the status bar
    networkmanager.enable = true;
  };

  system.stateVersion = "24.11";
}
