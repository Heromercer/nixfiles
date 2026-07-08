{ inputs, ... }:
{
  mercer.secrets = {
    nixos = { pkgs, ... }: {
      imports = [ inputs.sops-nix.nixosModules.sops ];
      environment.systemPackages = with pkgs; [
        sops
        age
      ];

      sops = {
        defaultSopsFile = ../../secrets.yaml;
        validateSopsFiles = false;

        age = {
          # automatically import host SSH keys as age keys
          sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
          # this will use an age key that is expected to already be in the filesystem
          keyFile = "/var/lib/sops-nix/key.txt";
          # generate a new key if the key specified above does not exist
          generateKey = true;
        };

        secrets = {
          pangolin-secret = {
            path = "/etc/nixos/secrets/pangolin.env";
          };
        };
      };
    };

    homeManager = {
      imports = [ inputs.sops-nix.homeManagerModules.sops ];

      sops = {
        # This is the alec/dev key and needs to have been copied to this location on the host
        age.keyFile = "/home/alec/.config/sops/age/keys.txt";

        defaultSopsFile = ../../secrets.yaml;
        validateSopsFiles = false;

        secrets = {
          "private_keys/alec" = {
            path = "/home/alec/.ssh/id_ed25519";
          };
        };
      };
    };
  };
}
