{ config,  pkgs, callPackage, ... }: 

/*
  configuration gathered from these sources:
  - https://nixos.wiki/wiki/I3
  - https://nixos.wiki/wiki/Xfce#Using_as_a_desktop_manager_and_not_a_window_manager
*/

{
  services = {
    xserver = {
      enable = true;   
    
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
    
      displayManager.defaultSession = "xfce";
    
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3status # gives you the default i3 status bar
          i3lock #default i3 screen locker
          i3blocks #if you are planning on using i3blocks over i3status
        ];
      };
    };
  };
  programs.dconf.enable = true;
  
  environment.pathsToLink = [ "/libexec" ];
}

