{ config, lib, pkgs, ... }: 

{

  imports = [
  ];

  config = {
    security = {
      sudo = {
        enable = true;
        extraRules = [
          {
            users = [ "frame" ];
            commands = [
              {
                command = "ALL";
                options = [ "NOPASSWD" ];
              }
            ];
          }
        ];
      };
    };
    users.users = {
        frame = {
          extraGroups = [
            "wheel"
            "networkmanager"
            "libvirtd"
            "disk"
            "audio"
            "floppy"
            "cdrom"
            "tty"
            "plugdev"
            "video"
            "users"
            "keys"
            "docker"
          ];
          home = "/home/frame";
          isNormalUser = true;
        };
    };
  };
}