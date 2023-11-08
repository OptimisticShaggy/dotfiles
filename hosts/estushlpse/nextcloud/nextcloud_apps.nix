{ config, pkgs, ... }:

{

  services.nextcloud =
      {
        appstoreEnable = true;
        extraAppsEnable = true;
        extraApps = with config.services.nextcloud.package.packages.apps; {
          inherit deck spreed;

          /*
          #Official Apps
          
external


          limit_login_to_ip
          files_accesscontrol
          files_automatedtagging
           #Talk
          
          groupfolders

          #Must Haves!
          end_to_end_encryption
          guests
          metadata
          mmm_ncdeck
          ncdownloader
          checksum
          chores
          collectives
          cookbook
          apporder
          #analytics
          appointments
          tables
          unsplash
          memories
          calendar
          tasks
          notes
          contacts
          mail
          cospend #Android App: https://apps.nextcloud.com/apps/moneybuster
          socialsharing_diaspora
          socialsharing_twitter
          socialsharing_telegram
          socialsharing_facebook
          socialsharing_email
          twofactor_webauthn
          richdocuments
          richdocumentscode

          workflow_media_converter
          workflow_ocr
          workflow_pdf_converter
          workflow_script
          
          ldap_contacts_backend
          ldap_write_support
          
          files_archive
          files_bpm
          files_confidential
          files_3dmodelviewer
          files_rightclick
          files_linkeditor
          files_markdown
          files_mindmap
          files_readmemd
          files_notify_redis
          files_snapshots
          #Nice to Have!
          forms
          news
          maps
          #announcementcenter
          */
        };
  };
}