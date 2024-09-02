{config, lib, pkgs, inputs, ...}:
{
  home.sessionVariables = {
    "WSLHOME" = "/mnt/c/Users/camoh/";
    "PATH" = "$PATH:$WSLHOME/.local/bin";
#    "DISPLAY" = "$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0";
"GPG_TTY" = "$(tty)";
"LIBGL_ALWAYS_INDIRECT" = 1;
  };
  programs.zsh.shellAliases = {
    "spicetify" = "spicetify.exe";
    "rd" = "rolldice -s $@";
    "notify-send" = "wsl-notify-send.exe $@";
  };
  programs.bash.shellAliases = {
    "rd" = "rolldice -s $@";
    "notify-send" = "wsl-notify-send.exe $@";
  };
  programs.fish.shellAliases = {
    "rd" = "rolldice -s $argv";
    "notify-send" = "wsl-notify-send.exe $argv";
  };
  }
