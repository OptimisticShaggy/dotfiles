
{ config, lib, pkgs, ... }: 

{

  imports = [ 
    ../../arch/pi3.nix 
    ../../networking/default.nix
    ../../networking/tailscale.nix
  ];

  config = {
    boot = {
      initrd = {
        network.ssh.enable = true;
        availableKernelModules = [ "xhci_pci" "usbhid" ];
      };
      loader = {
        raspberryPi = {
          version = 4;
        };
      };
    };
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
        fsType = "ext4";
      };
    };
    networking = {
      hostName = "estuspdash";
    };
      
    # Set your system kind (needed for flakes)
    nixpkgs.hostPlatform = "aarch64-linux";
  };
}
