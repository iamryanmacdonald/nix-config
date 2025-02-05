{...}: {
  # Adjust the color temperature(& brightness) of your screen according to
  # your surroundings. This may help your eyes hurt less if you are
  # working in front of the screen at night.
  #
  # works fine with both x11 & wayland(hyprland)
  #
  # https://gitlab.com/chinstrap/gammastep
  services.gammastep = {
    enable = true;
    # add a gammastep icon in the system tray
    # has problem with wayland, so disable it
    tray = false;

    # https://gitlab.com/chinstrap/gammastep/-/blob/master/gammastep.conf.sample?ref_type=heads
    settings = {
      general = {
        # it is a fake brightness adjustment obtained by manipulating the gamma ramps,
        # which means that it does not reduce the backlight　of the screen.
        # Preferably only use it if your normal backlight adjustment is too coarse-grained.
        brightness-day = "1.0";
        brightness-night = "0.8";
        fade = "1"; # gradually apply the new screen temperature/brightness over a couple of seconds.
        location-provider = "manual";
      };

      manual = {
        # Melbourne, Australia
        lat = "-37.8"; # latitude
        lon = "145.0"; # longitude
      };
    };

    temperature = {
      day = 5700;
      night = 4000;
    };
  };
}
