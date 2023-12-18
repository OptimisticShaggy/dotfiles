{ config, pkgs, ... }:

{
  services = {
    nextcloud =
              {
                enable = true;
                hostName = "estushlpse.narwhal-grue.ts.net";
                
                database.createLocally = true;
                
                datadir = "/mnt/runner/nextcloud";
                
                package = pkgs.nextcloud27;
                
                https = true;
                
                configureRedis = true;
                
                autoUpdateApps.enable = true;
                autoUpdateApps.startAt = "01:00:00";
                appstoreEnable = true;
                extraAppsEnable = true;
                
                maxUploadSize = "30G";
                
                config = {
                    overwriteProtocol = "https";
                    defaultPhoneRegion = "US";
                    dbtype = "pgsql";
                    
                    dbuser = "nextcloud";
                    dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
                    
                    
                    adminuser = "admin";
                    adminpassFile = "/mnt/runner/nextcloud/secret/adminuserpass.txt";

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
            postgresql.authentication = pkgs.lib.mkOverride 10 ''
                  #type database DBuser auth-method
                  local all      all    trust
                '';
  };
}