{
  myvars,
  lib,
}: let
  username = myvars.username;
  hosts = [
    "laptop-hyprland"
  ];
in
  lib.genAttrs hosts (_: "/home/${username}")
