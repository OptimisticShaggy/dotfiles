{ config, lib, pkgs, ... }: 

{
  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };

    openssh.settings.X11Forwarding = true;

    xrdp = {
        enable = true;
        defaultWindowManager = "startplasma-x11";
        openFirewall = true;
    };

    pipewire.pulse.enable = true;
  };

  environment.systemPackages = [
    pkgs.libsForQt5.bluez-qt
  ];
    
  
}
