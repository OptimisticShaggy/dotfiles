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
        services.nextcloud =
              {
                enable = true;
                hostName = "estushlpse.narwhal-grue.ts.net";
                nginx.enable = true;
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
                
                system.stateVersion = "23.05";
                
                systemd.network = {
                  enable = true;
                  networks."10-wan" = {
                    matchConfig.name = "vb-ncc";
                    networkConfig = {
                      DHCP = "ipv4";
                      IPv6AcceptRA = true;
                      }
                  };
                };
                
                networking = {
                  firewall = 
                    {
                      enable = true;
                      allowedTCPPorts = [ 80 443 ];
                    };
                };
                
          environment.etc."resolv.conf".text = "nameserver 8.8.8.8";
    };
  };
}