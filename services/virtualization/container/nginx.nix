{ config, pkgs, ... }:

{

  imports = [<sops-nix/modules/sops>];

  containers.nginx = {
      bindMounts = 
        {
          "nginx" =
          {
            hostPath = "/mnt/runner/nginx";
            mountPoint = "/var/www";
            isReadOnly = false;
          };
        };
      config = { config, pkgs, ... }:
          {
            services.nginx = {
                enable = true;
                recommendedGzipSettings = true;
                recommendedOptimisation = true;
                recommendedProxySettings = true;
                recommendedTlsSettings = true;

                sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";
                
                virtualHosts.default = 
                {
                    default = true;
                    forceSSL = true;
                    root = "/var/www";
                    sslCertificate = config.sops.secrets."hlpse_crt".path;
                    sslCertificateKey = config.sops.secrets."hlpse_key".path;
                    locations."/".return = "200 \"Hello from Nix!\"";
                };
            };

            system.stateVersion = "23.05";
                networking = {
                  firewall = 
                    {
                      enable = true;
                      allowedTCPPorts = [ 80 81 443 ];
                    };
                };
          };
  };
}