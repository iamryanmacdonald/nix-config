{pkgs, ...}: {
  # processing audio / video
  home.packages = with pkgs; [
    # images
    imagemagick
  ];
}
