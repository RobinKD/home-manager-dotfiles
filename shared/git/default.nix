{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.hm-modules.git;
in
with lib;
{
  options.hm-modules.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      package = null;
      settings = {
        user = {
          name = "RobinKD";
          email = "robin.kd@protonmail.com";
        };
        init = {
          defaultBranch = "main";
        };
        submodule = {
          recurse = true;
        };
        # aliases = {
        #   # TODO
        # };

      };
      signing = {
        key = "1891BFB363E4E118";
        signByDefault = true;
      };
    };

  };
}
