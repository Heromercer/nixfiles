{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      nhs = "nh os switch";
      nhsu = "nh os switch -u";
      check = "sudo nix flake check";
      nf = "cd .nixfiles";
    };

    functions = {
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
  };
}
