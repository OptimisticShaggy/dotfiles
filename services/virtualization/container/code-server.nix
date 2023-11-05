{ config, pkgs, ... }: 

{
    containers.codeserver = {
        bindMounts = 
        {
          "serverDataDir" =
          {
            hostPath = "/mnt/runner/codeserver";
            mountPoint = "/var/lib/codeserver";
            isReadOnly = false;
          };
        };
        
        config = { config, pkgs, ... }: {
            
            system.stateVersion = "23.05";

            systemd.network = {
            enable = true;
            networks."10-wan" = {
              matchConfig.name = "vb-codeserver";
              networkConfig = {
                DHCP = "ipv4";
                IPv6AcceptRA = true;
              }
              };
            };

            networking.firewall = 
                {
                  enable = true;
                  allowedTCPPorts = [ 80 443 ];
                };
            
            services.openvscode-server = {
                enable = true;
                serverDataDir = "/mnt/runner/code-server";
                extensionsDir = "/mnt/runner/code-server/ext";
                userDataDir = "/mnt/runner/code-server/user";

                withoutConnectionToken = true;
            };

            nixpkgs.config.permittedInsecurePackages = ["nodejs-16.20.2"];
        };
    };
}
