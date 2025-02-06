{pkgs, ...}: {
  fonts = {
    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;
    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some color emojis
    fontconfig.defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      sansSerif = ["Source Han Sans SC" "Source Han Sans TC" "Noto Color Emoji"];
      serif = ["Source Han Serif SC" "Source Han Serif TC" "Noto Color Emoji"];
    };
    fontDir.enable = true;
    packages = with pkgs; [
      # icon fonts
      font-awesome
      material-design-icons

      noto-fonts-emoji

      source-sans
      source-serif
      source-han-sans
      source-han-serif

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable-small/pkgs/data/fonts/nerd-fonts/manifests/fonts.json
      nerd-fonts.symbols-only # symbol icons only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka

      julia-mono
      dejavu_fonts
    ];
  };
}
