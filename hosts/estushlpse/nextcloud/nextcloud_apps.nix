{ config, pkgs, ... }:

{

  services.nextcloud =
      {
        extraAppsEnable = true;
        extraApps = with config.services.nextcloud.packages.apps; {
          inherit deck 
          /*
          inherit deck
          #Official Apps
          

          limit_login_to_ip
          files_accesscontrol
          files_automatedtagging
          spreed #Talk
          external
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
          analytics
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
          announcementcenter
          






           
          
          /*
          
          
          audioplayer
          assistant
          backup
          bookmarks
          breezedark
          browser_warning
          call_summary_bot
           
          calendar_news
          calendar_resource_management
          certificate24
          cfg_share_links
          
          
          
          
          discoursesso
          
          epubreader
          externalportal
          
          extract
          gestion
          gpxpod
          
          
          health
          jitsi
          login_notes
          
          flow_notifications
          
          riotchat
          
          
          ocs_api_viewer
          oidc
          oidc_login
          otpmanager
          onlyoffice
          integration_collaboard
          integration_homeassistant
          integration_giphy
          integration_gitlab
          integration_github
          integration_discourse
          integration_onedrive
          integration_openai
          integration_mastodon
          integration_mattermost
          integration_tmdb
          integration_peertube
          integration_reddit
          integration_youtube
          user_external
          user_usage_report
          user_sql
          user_backend_sql_raw
          user_saml
          uppush
          side_menu
           
          
          twofactor_admin
          twofactor_email
          twofactor_nextcloud_notification
          pandoc
          secrets
          shifts
          sms_relentless
          social
          
          polls
          talk_bot_ai_example
          talk_matterbridge


          text_templates
          terms_of_service
          translate
          timetracker
          preferred_providers
          phonetrack
          welcome
          
          */
      };
  };
}

/*
Do:
https://apps.nextcloud.com/apps/ownpad
https://apps.nextcloud.com/apps/files_external_ethswarm
https://apps.nextcloud.com/apps/cas


*/

/*
Questionable:
*/