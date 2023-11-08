{ config, pkgs, ... }:

{

  imports = [./nextcloud_apps.nix];

  services = {
    nextcloud =
              {
                enable = true;
                hostName = "estushlpse.narwhal-grue.ts.net";
                database.createLocally = true;
                datadir = "/mnt/runner/nextcloud";
                defaultPhoneRegion = "US";
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
                  adminpassFile = "/tmp/pass";
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
                    sslCertificate = "/mnt/runner/nginx/estushlpse.narwhal-grue.ts.net.crt";
                    sslCertificateKey = "/mnt/runner/nginx/estushlpse.narwhal-grue.ts.net.key";
                };
              };
              

            };
}