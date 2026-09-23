{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.hm-modules.hyprland;
in
with lib;
{
  options.hm-modules.hyprland = {
    enable = mkEnableOption "hyprland";
  };

  config = mkIf cfg.enable {
    home.pointerCursor = {
      enable = true;
      package = pkgs.rose-pine-hyprcursor; # Or your chosen package
      name = "rose-pine-hyprcursor"; # The name defined in the theme's manifest.hl
      size = 24;
      hyprcursor = {
        enable = true;
        size = 24;
      };
      gtk.enable = true;
      x11.enable = true;
    };

    # Noctalia settings
    xdg.configFile."noctalia/config.toml".source = ./noctalia-settings.toml;

  };
}
