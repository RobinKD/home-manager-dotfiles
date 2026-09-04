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
    ./bash
    # ./ssh
  ];

  # None yet
  # home.packages = with pkgs; [

  # ];
}
