{
  mercer.services.provides.pangolin = {
    nixos = {
      services.pangolin = {
        enable = true;
        settings = {
          flags = {
            disable_signup_without_invite = true;
            disable_user_create_org = true;
          };
        };
        baseDomain = "heromercer.com";
        letsEncryptEmail = "heromercer@gmail.com";
        openFirewall = true;
        dnsProvider = "cloudflare";
        environmentFile = "/etc/nixos/secrets/pangolin.env";
      };
    };
  };
}
