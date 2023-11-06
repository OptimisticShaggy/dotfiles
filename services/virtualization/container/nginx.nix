{ config, pkgs, ... }:

{

  imports = [];

  containers.nginx = {
      bindMounts = 
        {
          "nginx" =
          {
            hostPath = "/mnt/runner/nginx";
            mountPoint = "/var/www";
            isReadOnly = false;
          };
          "crt" =
          {
            hostPath = "/run/secrets/crt";
            mountPoint = "/var/www/crt";
            isReadOnly = true;
          };
          "key" =
          {
            hostPath = "/run/secrets/key";
            mountPoint = "/var/www/key";
            isReadOnly = true;
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
                
                virtualHosts."estushlpse.narwhal-grue.ts.net" = 
                {
                    default = true;
                    forceSSL = true;
                    root = "/var/www";
                    sslCertificate = "/var/www/crt";
                    sslCertificateKey = "/var/www/key";
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