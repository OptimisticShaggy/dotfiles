{ config, pkgs, ... }:

{

  services.nextcloud =
      {
        appstoreEnable = true;
        extraAppsEnable = true;
        extraApps = with config.services.nextcloud.package.packages.apps; {
          inherit calendar contacts mail notes tasks;

        };
  };
}