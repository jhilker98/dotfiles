{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let
  is-linux = pkgs.stdenv.isLinux;

  cfg = config.jhilker98.common;
in {
  options.jhilker98 = { common = { enable = mkEnableOption "Common"; }; };

  config = mkIf cfg.enable {
    home = {
      stateVersion = "24.05";
      username = "jhilker";
      packages = with pkgs; [ nixfmt plantuml units snowfallorg.flake sops nixd ];
      shellAliases = {
        "ls" = "${pkgs.eza}/bin/eza -alh --group-directories-first";
        "cat" = "${pkgs.bat}/bin/bat -p";
      };
    };
    programs = {
      home-manager.enable = true;
      #zsh = {
      #  enable = true;
      #  autocd = true;
      #  syntaxHighlighting.enable = true;
      #  autosuggestion.enable = true;
      #  dotDir = ".config/zsh";
      #};
    };
    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/jhilker/.config/sops/age/keys.txt";
    };
    xdg = {
      enable = true;
      mime = { enable = true; };
      userDirs = {
        enable = true;
        extraConfig = {
          "XDG_PROJECT_DIR" = "${config.home.homeDirectory}/Devel";
        };
      };
    };

   nix.settings.extra-experimental-features = ["nix-command" "flakes"];
  };
}
