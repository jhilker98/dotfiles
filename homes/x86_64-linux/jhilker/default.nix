{
# Snowfall Lib provides a customized `lib` instance with access to your flake's library
# as well as the libraries available from your flake's inputs.
lib,
# An instance of `pkgs` with your overlays and packages applied is also available.
pkgs,
# You also have access to your flake's inputs.
inputs,

# All other arguments come from the home home.
config, ... }:
with lib;
with lib.jhilker98; {

  jhilker98 = {
    common.enable = true;
    desktop = {
      qtile.enable = true;
    };
    starship.enable = true;
    dev = {
      emacs.enable = true;
      nixvim.enable = true;
    };
    langs = {
      latex.enable = false;
    };
    bash.enable = true;
    zsh.enable = true;
    git.enable = true;
    theme.enable = true;
    apps = {
      lazygit.enable = true;
    };
  };
  home.packages = with pkgs; [
    iamb
    jq
  ];
}
