{pkgs, ...}: {
  home.packages = with pkgs; (
    # -*- Data & Configuration Languages -*-#
    [
      #-- json like
      actionlint # GitHub Actions
      nodePackages.yaml-language-server
      taplo # TOML language server, formatter and validator

      #-- markdown
      marksman # language server for markdown

      #-- nix
      alejandra # nix code formatter
      deadnix # find and remove unused coe in .nix source files
      statix # linting and suggestions for the nix programming language
      nil
    ]
    # -*- General Purpose Languages -*-#
    ++ [
      #-- bash
      nodePackages.bash-language-server
      shellcheck
      shfmt

      #-- c/c++
      # c/c++ compiler, required by nvim-treesitter!
      gcc

      #-- lua
      stylua
      lua-language-server
    ]
    #-*- Web Development -*-#
    ++ [
      # HTML/CSS/JSON/ESLint language servers extracted from vscode
      nodePackages.vscode-langservers-extracted
    ]
    ++ [
      #-- Optional Requirements
      (ripgrep.override {withPCRE2 = true;}) # recursively searches directories for a regex pattern
    ]
  );
}
