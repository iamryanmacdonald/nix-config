{
  config,
  lib,
  ...
} @ args:
with lib; let
  cfg = config.modules.desktop.hyprland;
in {
  options.modules.desktop.hyprland = {
    enable = mkEnableOption "hyprland compositor";
    settings = lib.mkOption {
      default = {};
      type = with lib.types; let
        valueType =
          nullOr (oneOf [
            bool
            float
            int
            path
            str
            (attrsOf valueType)
            (listOf valueType)
          ])
          // {
            description = "Hyprland configuration value";
          };
      in
        valueType;
    };
  };

  config = mkIf cfg.enable (
    mkMerge ([
        {
          wayland.windowManager.hyprland.settings = cfg.settings;
        }
      ]
      ++ (import ./values args))
  );
}
