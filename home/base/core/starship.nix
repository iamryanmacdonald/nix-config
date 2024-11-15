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
      }
      // builtins.fromTOML (builtins.readFile "${nur-ryan4yin.packages.${pkgs.system}.catppuccin-starship}/palettes/mocha.toml");
  };
}
