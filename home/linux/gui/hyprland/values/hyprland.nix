{
  nur-ryan4yin,
  pkgs,
  ...
}: let
  package = pkgs.hyprland;
in {
  # NOTE: this executable is used by greetd to start a wayland session when system boot up
  # with such a vendor-no-locking script, we can switch to another wayland compositor without modifying greetd's config in NixOS module
  home.file.".wayland-session" = {
    executable = true;
    source = "${package}/bin/Hyprland";
  };

  # NOTE:
  # We have to enable hyprland/i3's systemd user service in home-manager,
  # so that gammastep/wallpaper-switcher's user service can be start correctly!
  # they are all depending on hyprland/i3's user graphical-session
  wayland.windowManager.hyprland = {
    inherit package;
    enable = true;

    settings = {
      env = [
        "MOZ_ENABLE_WAYLAND,1" # for firefox to run on wayland
        "MOZ_WEBRENDER,1"
        "NIXOS_OZONE_WL,1" # for any ozone-based browser & electron apps to run on wayland
        # misc
        "GDK_BACKEND,wayland"
        "QT_QPA_PLATFORM,wayland"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "SDL_VIDEODRIVER,wayland"
        "_JAVA_AWT_WM_NONREPARENTING,1"
      ];
      source = "${nur-ryan4yin.packages.${pkgs.system}.catppuccin-hyprland}/themes/mocha.conf";
    };

    systemd = {
      enable = true;
      variables = ["--all"];
    };

    extraConfig = builtins.readFile ../conf/hyprland.conf;
  };

  # hyprland configs, based on https://github.com/notwidow/hyprland
  xdg.configFile = {
    "hypr/mako" = {
      recursive = true;
      source = ../conf/mako;
    };
    "hypr/scripts" = {
      recursive = true;
      source = ../conf/scripts;
    };
    "hypr/waybar" = {
      recursive = true;
      source = ../conf/waybar;
    };
    "hypr/wlogout" = {
      recursive = true;
      source = ../conf/wlogout;
    };
    # music player - mpd
    "mpd" = {
      recursive = true;
      source = ../conf/mpd;
    };
  };
}
