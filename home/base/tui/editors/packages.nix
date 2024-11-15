{ pkgs, ... }: {
  home.packages = with pkgs; (
    # -*- Data & Configuration Languages -*-#
    [
      #-- nix
      alejandra # nix code formatter
      nil
    ]
    ++
    [
      # c/c++ compiler, required by nvim-treesitter!
      gcc

      #-- lua
      stylua
      lua-language-server
    ]
  );
}
