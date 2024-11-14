{ config, lib, ... }: with lib; let
  cfgWayland = config.modules.desktop.wayland;
in {
  imports = [
    ./base
    ../base.nix
  ];

  options.modules.desktop = {
    wayland = {
      enable = mkEnableOption "Wayland Display Server";
    };
  };
}
