{config, sops-nix, ... }: 

{
        imports = [];

        sops = {
                defaultSopsFile = ../.sops.yaml;
                age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        };

        sops.secrets.hlpse_crt = {};
        sops.secrets.hlpse_key = {};
}