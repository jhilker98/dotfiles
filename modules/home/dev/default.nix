{ config, pkgs, lib, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.dev;
in {
  options.jhilker98.dev = {
    enable = mkEnableOption "Enable development module and tools.";
  };
  config = mkIf cfg.enable {
    programs = {
      direnv = { enable = true; };
};
    home.packages = with pkgs; [ cheat act tldr cocogitto ];
    home.file."Documents/cheat/community".source = pkgs.fetchFromGitHub {
      owner = "cheat";
      repo = "cheatsheets";
      rev = "36bdb99dcfadde210503d8c2dcf94b34ee950e1d";
      sha256 = "0yzj15zkn7zfwspr07qfq9xqrkiakd1z2cgnb8r2nk2qz6ng9yq1";
    };

    xdg.configFile."cheat/conf.yml".source =
      (pkgs.formats.yaml { }).generate "conf.yml" {
        cheatpaths = [
          {
            name = "community";
            path = "${config.xdg.userDirs.documents}/cheat/community";
            readonly = true;
            tags = [ "community" ];
          }
          {
            name = "personal";
            path = "${config.xdg.userDirs.documents}/cheat/personal";
            readonly = true;
            tags = [ "personal" ];
          }
        ];
      };
 };
}
