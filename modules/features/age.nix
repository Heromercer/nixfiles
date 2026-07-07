{
  inputs,
  ...
}:
{
  mercer.secrets = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        environment.systemPackages = [
          pkgs.age
          inputs.agenix.packages.${pkgs.system}.default
        ];

        age = {
          secrets = {
            cloudflare-api-key = {
              file = ../../secrets/cloudflare-api-key.age;
              owner = "alec";
            };
          };
        };

      };
  };
}
