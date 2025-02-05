{
  myvars,
  lib,
  outputs,
}: let
  hosts = [
    "laptop-hyprland"
  ];
  username = myvars.username;
in
  lib.genAttrs
  hosts
  (
    name: outputs.nixosConfigurations.${name}.config.home-manager.users.${username}.home.homeDirectory
  )
