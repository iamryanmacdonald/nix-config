{ myvars, ... }: let
  hostName = "laptop";
in {
  imports = [
    ./hardware-configuration.nix

    ./impermanence.nix
  ];

  networking = {
    inherit hostName;
    inherit (myvars.networking) defaultGateway nameservers;

    # desktop needs a CLI for the status bar
    networkmanager.enable = true;
  };

  system.stateVersion = "24.05";
}
