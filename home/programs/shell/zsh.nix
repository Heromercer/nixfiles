{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "zsh-users/zsh-syntax-highlighting";}
        {name = "zdharma-continuum/fast-syntax-highlighting";}
      ];
    };

    shellAliases = {
      nhs = "nh os switch";
      nhsu = "nh os switch -u";
      check = "sudo nix flake check";
      nf = "cd .nixfiles";
    };

    siteFunctions = {
      y = ''
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d "" cwd < "$tmp"
        [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      '';
    };
  };
}
