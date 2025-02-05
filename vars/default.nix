{lib}: {
  initialHashedPassword = "$7$CU..../....rXsJS9iKCfbKKvOcFKmQA.$nln7KPAYBfH/T4b.pAdhgiyYQJj5Z3HqzVf9ymtZ3A8";
  networking = import ./networking.nix {inherit lib;};
  # Public Keys that can be used to login to all my PCs, laptops, and servers.
  #
  # Since its authority is so large, we must strengthen its security:
  # 1. The corresponding private key must be:
  #    1. Generated locally on every trusted client via:
  #      ```bash
  #      # KDF: bcrypt with 256 rounds, takes 2s on Apple M2):
  #      # Passphrase: digits + letters + symbols, 12+ chars
  #      ssh-keygen -t ed25519 -a 256 -C "ryan@xxx" -f ~/.ssh/xxx`
  #      ```
  #    2. Never leave the device and never sent over the network.
  # 2. Or just use hardware security keys like Yubikey/CanoKey.
  sshAuthorizedKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILQEtgkGDgybYhotMzlnr4KTS6c11U4D2QIDVoR/wByd ryan@windows"
  ];
  useremail = "ryan@ryanmacdonald.io";
  userfullname = "Ryan Macdonald";
  username = "ryan";
}
