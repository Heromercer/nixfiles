{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.sops-nix.homeManagerModules.sops];

  sops = {
    age.keyFile = "/home/alec/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      #sshconfig = {path = "/home/hadi/.ssh/config";};
      #github-key = {path = "/home/hadi/.ssh/github";};
      #gitlab-key = {path = "/home/hadi/.ssh/gitlab";};
      #jack-key = {path = "/home/hadi/.ssh/jack";};
      #signing-key = {path = "/home/hadi/.ssh/key";};
      #signing-pub-key = {path = "/home/hadi/.ssh/key.pub";};
      #pia = {path = "/home/hadi/.config/pia/pia.ovpn";};
    };
  };

  home.file.".config/nixos/.sops.yaml".text = ''
    keys:
      - &primary age190f2pt4z35cwe4spyq8yw4vehnhf70epgr8tktscadnx897ru3xsftw89l
    creation_rules:
      - path_regex: hosts/majula/secrets/secrets.yaml$
        key_groups:
          - age:
            - *primary
      - path_regex: hosts/server/secrets/secrets.yaml$
        key_groups:
          - age:
            - *primary
  '';

  systemd.user.services.mbsync.Unit.After = ["sops-nix.service"];
  home.packages = with pkgs; [sops age];

  wayland.windowManager.hyprland.settings.exec-once = ["systemctl --user start sops-nix"];
}
