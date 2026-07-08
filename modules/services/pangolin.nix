{ config, mercer, ... }: {
  mercer.services.provides.pangolin = {
    nixos = { config, ... }: {
      services.pangolin = {
        enable = true;
        baseDomain = "heromercer.com";
        letsEncryptEmail = "alawrence4@proton.me";
        openFirewall = true;
        dnsProvider = "cloudflare";
        environmentFile = config.sops.secrets.pangolin-secret.path;
        settings = {
          flags = {
            disable_signup_without_invite = true;
            disable_user_create_org = true;
          };
        };
      };
    };
    includes = [ mercer.secrets ];
  };
}
