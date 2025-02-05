{
  config,
  myvars,
  ...
}: let
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
  d = config.xdg.dataHome;
in {
  home.homeDirectory = "/home/${myvars.username}";

  # environment variables that are always set at login
  home.sessionVariables = {
    # clean up ~
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";

    # set default applications
    BROWSER = "firefox";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";
  };
}
