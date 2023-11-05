{pkgs, ... }:

{
  containers.nextclouddb = {
    config =
      { config, pkgs, ... }:
        { 
          services.mysql = {
            enable = true;
            ensureDatabases = [ "nextclouddb" ];
              ensureUsers = [
                {
                  name = "nextcloud";
                  ensurePermissions = { "nextcloud.*" = "ALL PRIVILEGES"; };
                }
              ];
          };
        };
  };
}