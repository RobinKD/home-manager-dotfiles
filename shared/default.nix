{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./firefox

    # cli
    # ./git
    ./distrobox
    ./bash
    # ./ssh
  ];

  # None yet
  # home.packages = with pkgs; [

  # ];
}
