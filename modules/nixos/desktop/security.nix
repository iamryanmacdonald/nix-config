{pkgs, ...}: {
  # gpg agent with pinentry
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
    pinentryPackage = pkgs.pinentry-qt;
    settings.default-cache-ttl = 4 * 60 * 60; # 4 hours
  };

  # security with gnome-kering
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  # security with polkit
  security.polkit.enable = true;
}
