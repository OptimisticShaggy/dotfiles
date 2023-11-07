{ config, pkgs, ... }:

{

  containers.ncc = {
      bindMounts = 
        {
          "nextcloud" =
          {
            hostPath = "/mnt/runner/nextcloud";
            mountPoint = "/var/lib/nextcloud";
            isReadOnly = false;
          };
        };
      config = { config, pkgs, ... }:
      {
        services = {
          nextcloud =
              {
                enable = true;
                hostName = "ncc.narwhal-grue.ts.net";
                database.createLocally = true;
                datadir = "/var/lib/nextcloud";
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
                  adminpassFile = "/var/lib/nextcloud/secret/pass";
                  #adminpassFile = "${pkgs.writeText "test123"}";
                };
              };

              nginx = {
                recommendedGzipSettings = true;
                recommendedOptimisation = true;
                recommendedProxySettings = true;
                recommendedTlsSettings = true;

                sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";
                
                virtualHosts."ncc.narwhal-grue.ts.net" = 
                {
                    forceSSL = true;
                    sslCertificate = "/etc/ssl/ncc.narwhal-grue.ts.net.crt";
                    sslCertificateKey = "/etc/ssl/ncc.narwhal-grue.ts.net.key";
                };
              };
              tailscale = {
                enable = true;
                permitCertUid = "OptimisticShaggy@github";
              };
              dnsmasq.resolveLocalQueries = false;

            };
                
                system.stateVersion = "23.05";
                
                systemd.network = {
                  enable = true;
                  networks."10-wan" = {
                    matchConfig.name = "vb-ncc";
                    networkConfig = {
                      DHCP = "ipv4";
                      IPv6AcceptRA = true;
                      };
                  };
                };
                
                networking = {
                  nameservers = [ "127.0.0.1" ];
                  firewall = 
                    {
                      enable = true;
                      allowedTCPPorts = [ 80 443 ];
                    };
                };
    };
    environment.etc."resolv.conf".text = "nameserver 8.8.8.8";
  };
}