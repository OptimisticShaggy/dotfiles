{ config, lib, pkgs, ... }: 

{

  imports = [
  ];

  
    config.users.users = {
        rose = {
          extraGroups = [
            "disk"
            "audio"
            "tty"
            "video"
            "users"
          ];
          home = "/home/rose";
          isNormalUser = true;
          packages = [ 
            pkgs.firefox 
            pkgs.thunderbird 
          ]
        };
    };
}