{ myvars, ... }:{
  # Don't allow mutation of users outside of config.
  users.mutableUsers = false;

  users.groups = {
    "${myvars.username}" = {};
    docker = {};
  };

  users.users."${myvars.username}" = {
    # generated by `mkpasswd -m scrypt`
    # we have to use initialHashedPassword here when using tmpfs for /
    inherit (myvars) initialHashedPassword;
    extraGroups = [
      myvars.username
      "networkmanager"
      "users"
      "wheel"
    ];
    home = "/home/${myvars.username}";
    isNormalUser = true;
  };
}