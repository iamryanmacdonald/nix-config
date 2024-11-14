# just is a command runner, Justfile is very similar to Makefile, but simpler.

# Use nushell for shell commands
# To use this justfile, you need to enter a shell with just & nushell installed:
#
# $ nix shell nixpkgs#just nixpkgs#nushell
set shell := ["nu", "-c"]

utils_nu := absolute_path("utils.nu")

############################################################################
#
# NixOS Desktop related commands
#
############################################################################

[linux]
[group('desktop')]
l-hypr mode="default":
  #!/usr/bin/env nu
  use {{utils_nu}} *;
  nixos-switch laptop-hyprland {{mode}}
