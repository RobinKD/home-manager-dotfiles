{ config, pkgs, ... }:
let
  nvidiaVersion = "610.57.04";
  # Get SHA with nix store prefetch-file https://download.nvidia.com/XFree86/Linux-x86_64/${version}/NVIDIA-Linux-x86_64-${version}.run
  nvidiaSha256 = "sha256-suk1xmuDuwDAyFe8jg7g/VLekoa0DJzB7sKafOfrEW0=";
  # Might need to activate a script shown in hm activation (and create folder for it)
in
{
  imports = [
    ./shared
  ];

  hm-modules = {
    firefox.enable = true;
    librewolf.enable = true;
    bash.enable = true;
    distrobox.enable = true;
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "keanu";
  home.homeDirectory = "/var/home/keanu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };

  targets.genericLinux = {
    enable = true;
    gpu.nvidia = {
      enable = true;
      version = nvidiaVersion;
      sha256 = nvidiaSha256;
    };
  };
}
