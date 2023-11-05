{ config, ... }

{
    
    users.users.<name>.openssh.authorizedKeys.keyFiles
    
    
    
    programs.ssh.knownHosts = {
    cstpli = {
      extraHostNames = [];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
    czhlplay = {
      extraHostNames = [];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
    estushlpse = {
      extraHostNames = [ "estushlpse" "100.70.250.92" ];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
    estuspd1x2 = {
      extraHostNames = [];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
    estuspdash = {
      extraHostNames = [];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
    estuspthreedprint = {
      extraHostNames = [];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
    portphpe = {
      extraHostNames = [];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
    portpphab = {
      extraHostNames = [ "portpphab" "100.76.46.33" ];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
    portptab = {
      extraHostNames = [ "portptab" "100.110.152.142" ];
      publicKeyFile = "/home/frame/.ssh/authorized_keys/cstpli.pub";
    };
  };
}