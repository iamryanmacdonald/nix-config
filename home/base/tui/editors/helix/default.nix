{
  nur-ryan4yin,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    package = pkgs.helix;

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        color-modes = true;
        cursorline = true;
        indent-guides.render = true;
        line-number = "relative";
        lsp.display-messages = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };

      keys.normal = {
        esc = ["collapse_selection" "keep_primary_selection"];

        space = {
          space = "file_picker";
          q = ":q";
          w = ":w";
        };
      };
    };
  };

  # https://github.com/catppuccin/helix
  xdg.configFile."helix/themes".source = "${nur-ryan4yin.packages.${pkgs.system}.catppuccin-helix}/themes/default";
}
