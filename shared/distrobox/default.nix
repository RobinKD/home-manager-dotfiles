{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.hm-modules.distrobox;
  homeDir = config.home.homeDirectory;
  configDir = "${homeDir}/.config/home-manager/";
  updateDistroboxes = "${pkgs.writeShellScriptBin "updateDistroboxes" ''
    force=0
    while getopts "f" opt; do
      case $opt in
        f) force=1 ;;
        *) echo "Usage: $0 [-f]" >&2; exit 1 ;;
      esac
    done

    containers_file=${config.xdg.configHome}/distrobox/containers.ini
    prev_hash_file=${config.xdg.configHome}/distrobox/prev_hash
    new_hash=$(sha256sum $containers_file | cut -f 1 -d " ")

    if [[ -f $prev_hash_file ]]; then
      prev_hash=$(cat $prev_hash_file)
    else
      prev_hash=0
    fi

    if [[ $prev_hash != $new_hash || $force -eq 1 ]]; then
      rm -rf /tmp/storage-run-1000/containers
      rm -rf /tmp/storage-run-1000/libpod/tmp
      distrobox-assemble create --file $containers_file
      echo $new_hash > $prev_hash_file
    fi
  ''}";
in
with lib;
{
  options.hm-modules.distrobox = {
    enable = mkEnableOption "distrobox";
  };

  config = mkIf cfg.enable {
    home.packages = [ updateDistroboxes ];
    programs.distrobox = {
      enable = true;
      package = null;
      settings = {
        container_manager = "podman";
        non_interactive = "1"; # required for unattended systemd assemble
        container_generate_entry = 1; # if any container exports GUI apps
      };
      enableSystemdUnit = false;
      containers = {
        base-arch = {
          image = "archlinux:latest";
          nvidia = true;
          additional_packages = "git base-devel";
          # entry = false;  # optional: hide this from your app menu / `distrobox list` UX
        };
        emacs = {
          # Do not forget to export emacs and emacsclient after first creation
          clone = "base-arch";
          nvidia = true;
          additional_packages = "base-devel git emacs tree-sitter shfmt shellcheck enchant pandoc cmake";
          # Install nixfmt through yay
          # git clone https://aur.archlinux.org/yay.git &>/dev/null && cd yay && makepkg -cCsi --noconfirm && yay -Sy nixfmt
          entry = true;
        };
      };
    };
  };
}
