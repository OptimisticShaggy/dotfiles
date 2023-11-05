{ config, pkgs, ... }: 

{
  {
    config = { config, pkgs, ... }: {
      services.syncthing = {
        enable = true;
        user = "frame";
        dataDir = "/home/frame/Sync";    # Default folder for new synced folders
        configDir = "/home/frame/Sync/.config/syncthing";   # Folder for Syncthing's settings and keys
      };
    };
  };
}