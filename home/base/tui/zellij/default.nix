{
  pkgs,
  pkgs-stable,
  ...
}: let
  shellAliases = {
    "zj" = "zellij";
  };
in {
  # only works in bash/zsh, not nushell
  home.shellAliases = shellAliases;

  # auto start zellik in nushell
  programs.nushell.extraConfig = ''
    # auto start zellij
    # except when in emacs or zellij itself
    if (not ("ZELLIJ" in $env)) and (not ("INSIDE_EMACS" in $env)) {
      if "ZELLIJ_AUTO_ATTACH" in $env and $env.ZELLIJ_AUTO_ATTACH == "true" {
        ^zellij attach -c
      } else {
        ^zellij
      }

      # Auto exit the shell session when zellij exits
      $env.ZELLIJ_AUTO_EXIT = "false" # disable auto exit
      if "ZELLIJ_AUTO_EXIT" in $env and $env.ZELLIJ_AUTO_EXIT == "true" {
        exit
      }
    }
  '';
  programs.nushell.shellAliases = shellAliases;

  programs.zellij = {
    enable = true;
    package =
      if pkgs.stdenv.isLinux
      then pkgs-stable.zellij
      else pkgs.zellij;
  };

  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
