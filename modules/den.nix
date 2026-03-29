{
  inputs,
  den,
  lib,
  ...
}:
{
  imports = [ inputs.den.flakeModule ];

  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.hosts.x86_64-linux.majula.users.alec = { };

  den.aspects.majula = {
    includes = [
      den.provides.hostname
      den.aspects.git
      den.aspects.neovim
    ];
    nixos =
      { pkgs, config, ... }:
      {
        environment.systemPackages = with pkgs; [
          neovim
          hello
        ];
        imports = [ ./_majula-hardware.nix ];
        networking.networkmanager.enable = true;
        services.desktopManager.plasma6.enable = true;
        services.displayManager.sddm.enable = true;
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
  };

  den.aspects.alec = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      den.aspects.git
    ];
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.cowsay ];
        programs.home-manager.enable = true;
      };
  };
}
