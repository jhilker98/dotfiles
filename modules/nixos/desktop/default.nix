{ config, lib, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.nixos.desktop;
in {
  options.jhilker98.nixos.desktop = {
    enable = mkEnableOption "Desktop";
    # useWayland =
  };
}
