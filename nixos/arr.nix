{inputs, ...}: {
  imports = [inputs.nixarr.nixosModules.default];
  nixarr = {
    enable = false;
    jellyfin.enable = false;
  };
}
