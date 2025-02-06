{myvars, ...}: {
  home = {
    inherit (myvars) username;

    stateVersion = "24.11";
  };

  # Let home-manager install and manage itself.
  programs.home-manager.enable = true;
}
