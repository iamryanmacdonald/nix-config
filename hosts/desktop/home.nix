{
  modules.desktop = {
    hyprland = {
      nvidia = true;
      settings = {
        monitor = "eDP-1,highres,auto,1.5,bitdepth,10";
      };
    };
  };

  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host github.com
        IdentitiesOnly yes
        IdentityFile ~/.ssh/desktop
    '';
  };
}
