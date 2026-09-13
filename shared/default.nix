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
  ];

  # None yet
  # home.packages = with pkgs; [

  # ];
}
