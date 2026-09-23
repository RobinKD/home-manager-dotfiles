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
    home.packages = with pkgs; [
      rose-pine-hyprcursor
    ];
  };
}
