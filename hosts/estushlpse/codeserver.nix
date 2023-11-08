{ config, pkgs, ... }: 

{
  services.openvscode-server = {
                enable = true;
                user = "frame";
                group = "users";
                host = "estushlpse.narwhal-grue.ts.net";
                
                serverDataDir = "/mnt/runner/code-server";
                extensionsDir = "/mnt/runner/code-server/ext";
                userDataDir = "/mnt/runner/code-server/user";

                withoutConnectionToken = true;
            };

            nixpkgs.config.permittedInsecurePackages = ["nodejs-16.20.2"];
}
