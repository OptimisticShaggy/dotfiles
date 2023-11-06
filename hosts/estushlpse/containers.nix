{ config, ... }: 

{
  imports = [
    ../../secrets/hosting/default.nix
    #../../services/virtualization/container/code-server.nix
    #../../services/virtualization/container/nextcloud.nix
    ../../services/virtualization/container/nginx.nix
  ];
}