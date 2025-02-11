{
  genSpecialArgs,
  inputs,
  lib,
  mylib,
  myvars,
  system,
  ...
} @ args: let
  name = "desktop";

  base-modules = {
    nixos-modules = map mylib.relativeToRoot [
      # common
      "secrets/nixos.nix"
      "modules/nixos/desktop.nix"
      # host specific
      "hosts/${name}"
    ];
    home-modules = map mylib.relativeToRoot [
      # common
      "home/linux/gui.nix"
      # host specific
      "hosts/${name}/home.nix"
    ];
  };

  modules-hyprland = {
    nixos-modules =
      [
        {
          modules.desktop.wayland.enable = true;
          modules.secrets.desktop.enable = true;
          modules.secrets.impermanence.enable = true;
        }
      ]
      ++ base-modules.nixos-modules;
    home-modules =
      [
        {
          modules.desktop.hyprland.enable = true;
        }
      ]
      ++ base-modules.home-modules;
  };
in {
  nixosConfigurations = {
    # host with hyprland compositor
    "${name}-hyprland" = mylib.nixosSystem (modules-hyprland // args);
  };

  # generate iso image for hosts with desktop environment
  packages = {
    "${name}-hyprland" = inputs.self.nixosConfigurations."${name}-hyprland".config.formats.iso;
  };
}
