{pkgs, ...}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # system monitoring
    btop

    # system tools
    psmisc # killall / pstree / prtstat / fsuser / ...
  ];
}
