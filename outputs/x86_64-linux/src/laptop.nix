{ genSpecialArgs, inputs, lib, mylib, myvars, system, ... } @ args: let
  name = "laptop";

  base-modules = {
    nixos-modules = map mylib.relativeToRoot [
      # common
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
	}
      ]
      ++ base-modules.nixos-modules;
    home-modules =
      [
        { modules.desktop.hyprland.enable = true; }
      ]
      ++ base-modules.home-modules;
  };
in {
  nixosConfigurations = {
    "${name}-hyprland" = mylib.nixosSystem (modules-hyprland // args);
  };
}
