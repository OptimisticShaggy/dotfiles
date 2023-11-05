{ config, pkgs, ... }:

{
  networking = {
    
    networkmanager.virtualised-devices = [
      {
        hostInterface = "tailscale0"; # Replace with the name of the host interface to use
        mac = "77:22:00:44:34:57"; # Replace with a unique MAC address
        name = "veth0"; # Replace with a unique name for the virtual interface
        enable = true;
      }
    ];
    
    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalternalInterface = "tailscale0";
      enableIPv6 = true;
    };
  };
  
}