{
  nur-ryan4yin,
  pkgs,
  pkgs-unstable,
  ...
}: {
  # terminal file manager
  programs.yazi = {
    enable = true;
    # changing working directory when exiting yazi
    enableBashIntegration = true;
    enableNushellIntegration = true;
    package = pkgs-unstable.yazi;

    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };

  xdg.configFile."yazi/theme.toml".source = "${nur-ryan4yin.packages.${pkgs.system}.catppuccin-yazi}/mocha.toml";
}
