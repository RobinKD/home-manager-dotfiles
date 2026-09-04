{ config, lib, ... }:
let
  cfg = config.hm-modules.bash;
  homeDir = config.home.homeDirectory;
  dotDir = "${homeDir}/.dotfiles";
in
with lib;
{
  options.hm-modules.bash = {
    enable = mkEnableOption "bash";
  };

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true; # Already default
      package = null;
      initExtra = ''
        # .bashrc

        # Source global definitions
        if [ -f /etc/bashrc ]; then
          . /etc/bashrc
        fi

        # User specific environment
        if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
          PATH="$HOME/.local/bin:$HOME/bin:$PATH"
        fi
        export PATH
      '';
      historySize = 10000;
      historyIgnore = [
        "ls"
        "cd"
        "exit"
      ];
      shellOptions = [
        # Append to history file rather than replacing it.
        "histappend"

        # check the window size after each command and, if
        # necessary, update the values of LINES and COLUMNS.
        "checkwinsize"

        # Extended globbing.
        "extglob"
        "globstar"

        # Warn if closing shell with running jobs.
        "checkjobs"
      ];
      sessionVariables = {
        EDITOR = "emacsclient";
        CUPS_GSSSERVICENAME = "ipp";
      };
      shellAliases = {
        # some more ls aliases
        ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
        l = "eza --icons  -a --group-directories-first -1";
        etree = "eza --icons --tree --group-directories-first";

        # Alias for emacs;
        restart-emacs = "systemctl restart --user emacs";
        emacs-debug = "emacs --debug-init";

      };
    };
  };
}
