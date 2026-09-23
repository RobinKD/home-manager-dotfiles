{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./firefox

    # cli
    ./git
    ./distrobox
    ./bash
    # ./ssh

    # GUI
    ./gnome
    ./hyprland
  ];

  # None yet
  # home.packages = with pkgs; [

  # ];
}
