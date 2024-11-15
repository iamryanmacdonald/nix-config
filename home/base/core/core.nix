{
  pkgs,
  nur-ryan4yin,
  ...
}: {
  programs = {
    # Atuin replaces your existing shell history with an SQLite database
    # and records additional context for your commands.
    # Additionally, it provides optional and fully encrypted
    # synchronisation of your history between machines, via an Atuin server.
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };

    # a cat(1) clone with syntax highlighting and git integration.
    bat = {
      config = {
        pager = "less -FR";
        theme = "catppuccin-mocha";
      };
      enable = true;
      themes = {
        # https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme
        catppuccin-mocha = {
          file = "Catppuccin-mocha.tmTheme";
          src = nur-ryan4yin.packages.${pkgs.system}.catppuccin-bat;
        };
      };
    };

    # A modern replacement for 'ls'
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      # do not enable aliases in nushell!
      enableNushellIntegration = false;
      git = true;
      icons = "auto";
    };

    # A command-line fuzzy finder
    fzf = {
      # https://github.com/catppuccin/fzf
      # catppuccin-mocha
      colors = {
        "bg" = "#1E1E2E";
        "bg+" = "#313244";
        "fg" = "#CDD6F4";
        "fg+" = "#CDD6F4";
        "header" = "#F38BA8";
        "hl" = "#F38BA8";
        "hl+" = "#F38BA8";
        "info" = "#CBA6F7";
        "marker" = "#F5E0DC";
        "pointer" = "#F5E0DC";
        "prompt" = "#CBA6F7";
        "spinner" = "#F5E0DC";
      };
      enable = true;
    };

    # zoxide is a smarter cd command, inspired by z and autojump.
    # It remembers which directories you use most frequently,
    # so you can "jump" to them in just a few keystrokes.
    # zoxide works on all major shells.
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };
  };
}
