{ config, pkgs, ... }:

{

  imports = [];

  virtualisation.oci-containers.containers."nginx" = 
    {
      image = "linuxserver/nginx:latest";
      environment = {
        "USE_HTTPS" = "false";
      };
      ports = [ "8080:8080" ];

    };


}