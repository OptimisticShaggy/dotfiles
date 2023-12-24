{ config, pkgs, ... }:

{

  config = {
    environment = {
      systemPackages = [
        pkgs.ventoy-full
        pkgs.testdisk
        pkgs.cdrtools
      ];
    };
  };

}