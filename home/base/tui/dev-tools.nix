{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    pkgs-unstable.pgcli
    sqlite

    # misc
    protobuf

    gitleaks
    # Automatically trims your branches whose tracking remote refs are merged or gone
    # It's really useful when you work on a project for a long time.
    git-trim
  ];

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
