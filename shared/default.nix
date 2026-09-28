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

  home.packages = with pkgs; [
    socat
    ripgrep-all
    nixfmt
    stylua
    lua-language-server
    shfmt
    shellcheck
    pandoc
    nixd
  ];

}
