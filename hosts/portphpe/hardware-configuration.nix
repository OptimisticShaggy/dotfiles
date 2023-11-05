
{ config, lib, pkgs, ... }: 

{

  imports = [ 
    ../../arch/x64.nix 
    ../../networking/default.nix
    ../../networking/tailscale.nix
    ../../networking/hidden_wifi_net.nix
    ../../networking/bluetooth.nix
  ];

  config = {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      
      kernelModules = [ "kvm-amd" ];
      
      initrd = {
        availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ]:
        network.ssh.enable = true;
        kernelModules = [ ];
      };
    };
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/nixos";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
      };
    };
    networking = {
      hostName = "portphpe";
    };
    swapDevices = [
      {
        device = "/dev/disk/by-label/swap";
      }
    ];
    
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      
    # Set your system kind (needed for flakes)
    nixpkgs.hostPlatform = "x86_64-linux";
  };
}
