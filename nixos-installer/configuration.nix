{pkgs, ...}: {
  # ssh-agent is used to pull my private secrets repo from github when deploying my nixos config
  programs.ssh.startAgent = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    curl
    git
    gnumake
    just # a command runner(replacement of gnumake in some cases)
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    nix-output-monitor
    wget
  ];
  networking = {
    defaultGateway = "192.168.0.1";
    # configures the network interface (including wireless) via `nmcli` and `nmtui`
    networkmanager.enable = true;
  };
  system.stateVersion = "24.05";
}
