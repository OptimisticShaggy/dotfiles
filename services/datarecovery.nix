{ config, pkgs, ... }:

{

  config = {
    environment = {
      systemPackages = [
        pkgs.testdisk
        pkgs.cdrtools
      ];
    };
  };

}