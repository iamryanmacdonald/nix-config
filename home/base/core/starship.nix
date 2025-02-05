{
  nur-ryan4yin,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    settings =
      {
        palette = "catppuccin_mocha";

        character = {
          success_symbol = "[›](bold green)";
          error_symbol = "[›](bold red)";
        };
      }
      // builtins.fromTOML (builtins.readFile "${nur-ryan4yin.packages.${pkgs.system}.catppuccin-starship}/palettes/mocha.toml");
  };
}
