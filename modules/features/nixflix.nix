{ inputs, ... }:
{
  mercer.arr = {
    nixos = {
      imports = [ inputs.nixflix.nixosModules.default ];

      nixflix = {
        enable = true;
      };
    };
  };
}
