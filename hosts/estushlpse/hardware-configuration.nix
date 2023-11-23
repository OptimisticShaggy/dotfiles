{ config, ... }:

{
  
  imports = [ 
    ../../networking/ssh.nix
    ../../networking/tailscale.nix
  ];
  
  config = {
    
    networking = {
      hostName = "estushlpse";
      firewall = {
        checkReversePath = "loose";
        enable = true;
        allowedTCPPorts = [ 80 443 3000];
      };
      /*
      nat = {
        enable = true;
        internalInterfaces = ["vb-+"];
        externalInterface = "enp3s0";
        # Lazy IPv6 connectivity for the container
        enableIPv6 = true;
      };
      */
    };


    systemd.network = {
      enable = true;
      wait-online.enable = false;
      networks."10-enp3s0" = {
        matchConfig.name = "enp3s0";
        networkConfig = {
          DHCP = "ipv4";
          IPv6AcceptRA = true;
          };
      };
      networks."20-tailscale0" = {
        matchConfig.name = "tailscale0";
        networkConfig = {
          DHCP = "ipv4";
          IPv6AcceptRA = true;
          };
      };
    };

    boot = {
      kernelModules = [ "kvm-intel" ];
      initrd = {
        network.ssh.enable = true;
        kernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
      };
      
      loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        systemd-boot = {
          enable = true;
        };
      };
    };
    hardware = {
      opengl.enable = true;
      cpu = {
        intel = {
          updateMicrocode = true;
        };
      };
    };

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/root";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
      };
      "/home" = {
        device = "/dev/disk/by-label/home";
        fsType = "ext4";
      };
      "/mnt/runner" = {
        device = "/dev/disk/by-label/runner";
        fsType = "ext4";
      };
      "/mnt/dw" = {
        device = "/dev/disk/by-uuid/65577975-3b04-4fcc-86ee-bce0b9cc44af";
        fsType = "ext4";
      }
    };

  # Set your system kind (needed for flakes)
  nixpkgs.hostPlatform = "x86_64-linux";

  };


}
