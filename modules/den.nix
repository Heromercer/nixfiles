{inputs, den, lib, ... }: {
  imports = [inputs.den.flakeModule];

  den.schema.user.classes = lib.mkDefault ["homeManager"];

  den.hosts.x86_64-linux.majula.users.alec = {};

  den.aspects.majula = {
    includes = [den.provides.hostname];
    nixos = {pkgs, config, ...}: {environment.systemPackages = with pkgs; [neovim hello git ];
    imports = [./_majula-hardware.nix];
    networking.networkmanager.enable = true;
    nix.settings.experimental-features = ["nix-command" "flakes"];
    };
  };

  den.aspects.alec = {
    includes = [den.provides.define-user den.provides.primary-user den.aspects.git];
    homeManager = {pkgs, ...}: {home.packages = [pkgs.cowsay pkgs.lazygit];
    programs.home-manager.enable = true;
    };
  };
}
