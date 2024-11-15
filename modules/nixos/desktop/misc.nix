{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  # add user's shell into /etc/shells
  environment.shells = with pkgs; [
    bashInteractive
    pkgs-unstable.nushell
  ];

  environment.variables = {
    TZ = "${config.time.timeZone}";
  };

  programs = {
    # The OpenSSH agent remembers private keys for you
    # so that you don't have to type in passphrases every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent.
    ssh.startAgent = true;
  };

  # fix for `sudo xxx` in kitty/wezterm/foot and other modern terminal emulators
  security.sudo.keepTerminfo = true;

  # set user's default shell system-wide
  users.defaultUserShell = pkgs.bashInteractive;
}
