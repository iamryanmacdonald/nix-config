{pkgs, ...}: {
  home.packages = with pkgs; [
    alsa-utils # provides amixer / alsamixer / ...
    grim # taking screenshots
    hyprpicker # colour picker
    mako # the notification daemon, the same as dunst
    mpd # for playing system sounds
    networkmanagerapplet # provide a GUI app: nm-connection-editor
    slurp # selecting a region to screenshot
    swaybg # the wallpaper
    swayidle # the idle timeout
    swaylock # locking the screen
    waybar # the status bar
    wlogout # logout menu
    wl-clipboard # copying and pasting
  ];
}
