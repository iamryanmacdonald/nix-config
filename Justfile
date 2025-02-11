# just is a command runner, Justfile is very similar to Makefile, but simpler.

# Use nushell for shell commands
# To use this justfile, you need to enter a shell with just & nushell installed:
#
# $ nix shell nixpkgs#just nixpkgs#nushell
set shell := ["nu", "-c"]

utils_nu := absolute_path("utils.nu")

############################################################################
#
#  Common commands(suitable for all machines)
#
############################################################################

# List all the just commands
default:
  @just --list

# Run eval tests
[group('nix')]
test:
  nix eval .#evalTests --show-trace --print-build-logs --verbose

# Update all the flake inputs
[group('nix')]
up:
  nix flake update

# Update specific input
# Usage: just upp nixpkgs
[group('nix')]
upp input:
  nix flake update {{input}}

############################################################################
#
# NixOS Desktop related commands
#
############################################################################

[linux]
[group('desktop')]
d-hypr mode="default":
  #!/usr/bin/env nu
  use {{utils_nu}} *;
  nixos-switch desktop-hyprland {{mode}}

[linux]
[group('desktop')]
l-hypr mode="default":
  #!/usr/bin/env nu
  use {{utils_nu}} *;
  nixos-switch laptop-hyprland {{mode}}
