{ config, pkgs, ... }:

{
    
  imports = [
      ./frame.nix
 ];

  config = {
    environment = {
      systemPackages = [
        pkgs.ntfs3g
        pkgs.git
        pkgs.jmtpfs
        ];
    };
    # users.mutableUsers = false; error:
      # Failed assertions:
       #- Neither the root account nor any wheel user has a password or SSH authorized key.
#       You must set one to prevent being locked out of your system.
 #      If you really want to be locked out of your system, set users.allowNoPasswordLogin = true;
  #     However you are most probably better off by setting users.mutableUsers = true; and
   #    manually running passwd root to set the root password.
#(use '--show-trace' to show detailed location information)
  
  services = {
      pcscd = {
        enable = true;
      };
    };
  };
}