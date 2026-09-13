{
  config,
  lib,
  pkgs,
  ...
}:
let
  # Gnome config can easily be exported using dconf2nix (thanks to https://github.com/nix-community/dconf2nix)
  cfg = config.hm-modules.gnome;
  dconf-settings = import ./dconf.nix { inherit lib; };
in
with lib;
{
  options.hm-modules.gnome = {
    enable = mkEnableOption "gnome";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs.gnomeExtensions; [
      appindicator
      mouse-follows-focus-2
      multi-monitor-bar
      night-light-scheduler
      soft-brightness-plus
      sound-output-organizer
      vitals
      paperwm

      # VShell PaperWM
    ];
    dconf = {
      settings = dconf-settings;
    };
  };
}
