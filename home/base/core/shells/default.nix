{pkgs-unstable, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.nushell = {
    configFile.source = ./config.nu;
    enable = true;
    package = pkgs-unstable.nushell;
  };
}
