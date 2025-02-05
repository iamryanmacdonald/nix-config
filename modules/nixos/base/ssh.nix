{
  lib,
  myvars,
  ...
}: {
  # Add terminfo database of all known terminals to the system profile.
  # https://github.com/NixOS/nixpkgs/blob/nixos-24.05/nixos/modules/config/terminfo.nix
  environment.enableAllTerminfo = true;

  networking.firewall.enable = lib.mkDefault false;

  programs.ssh = myvars.networking.ssh;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      # root user is used for remote deployment, so we need to allow it
      PermitRootLogin = "prohibit-password";
      X11Forwarding = true;
    };
  };
}
