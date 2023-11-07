{ config, pkgs, ... }:

{

  services = {
    nextcloud =
              {
                enable = true;
                hostName = "estushlpse.narwhal-grue.ts.net";
                #hostName = "localhost";
                database.createLocally = true;
                datadir = "/mnt/runner/nextcloud";
                package = pkgs.nextcloud27;
                https = true;
                configureRedis = true;
                autoUpdateApps.enable = true;
                autoUpdateApps.startAt = "01:00:00";
                appstoreEnable = true;
                maxUploadSize = "30G";
                config = {
                  overwriteProtocol = "https";
                  dbtype = "pgsql";
                  adminuser = "admin";
                  adminpassFile = "/mnt/runner/nextcloud/secret/pass";
                };
              };

              nginx = {
                recommendedGzipSettings = true;
                recommendedOptimisation = true;
                recommendedProxySettings = true;
                recommendedTlsSettings = true;

                sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";                

                virtualHosts."estushlpse.narwhal-grue.ts.net" = 
                {
                    forceSSL = true;
                    sslCertificate = "/etc/ssl/estushlpse.narwhal-grue.ts.net.crt";
                    sslCertificateKey = "/etc/ssl/estushlpse.narwhal-grue.ts.net.key";
                };
              };
              

            };
}