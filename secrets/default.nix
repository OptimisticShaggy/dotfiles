{config, sops-nix, ... }: 

{
        imports = [inputs.sops-nix.nixosModules.sops];

        sops = {
                defaultSopsFile = ./ts_estushlpse.yaml;
                age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        };

        sops.secrets.hlpse_crt = {};
        sops.secrets.hlpse_key = {};
}