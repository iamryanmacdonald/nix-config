{ config, lib, pkgs, pkgs-unstable, ... }:
###############################################################################
#
# AstroNvim's configuration and all its dependencies (LSP, formatter, etc.)
#
###############################################################################
let
  shellAliases = {
    v = "nvim";
    vdiff = "nvim -d";
  };
in {
  home.activation.installAstroNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./nvim}/ ${config.xdg.configHome}/nvim/
  '';

  home.shellAliases = shellAliases;

  programs = {
    neovim = {
      enable = true;
      package = pkgs-unstable.neovim-unwrapped;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      extraWrapperArgs = with pkgs; [
        "--suffix"
        "LIBRARY_PATH"
        ":"
        "${lib.makeLibraryPath [stdenv.cc.cc zlib]}"

        "--suffix"
        "PKG_CONFIG_PATH"
        ":"
        "${lib.makeSearchPathOutput "dev" "lib/pkgconfig" [stdenv.cc.cc zlib]}"
      ];

      plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
      ];
    };
  };
}
