{
  config,
  pkgs-unstable,
  ...
}: let
  localBin = "${config.home.homeDirectory}/.local/bin";
in {
  programs.bash = {
    bashrcExtra = ''
      export PATH=$PATH:${localBin}
    '';
    enable = true;
    enableCompletion = true;
  };

  programs.nushell = {
    configFile.source = ./config.nu;
    enable = true;
    package = pkgs-unstable.nushell;
  };
}
