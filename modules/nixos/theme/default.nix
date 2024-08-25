{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.theme;
in {
  options.jhilker98.theme = { enable = mkEnableOption "enable theme module"; };
  config = mkIf cfg.enable {
    stylix = {
      image = pkgs.fetchurl {
        url =
          "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/YRAJQAT4Dg-avesta-rezaeizadeh-unsplash.jpg";
        sha256 = "06n1dlkdhz5c287b72aplg3z90a3rixy79ryyjskmdfqy283r1an";
      };
        targets = {
          grub.enable = true;
      };
    };
  };
}
