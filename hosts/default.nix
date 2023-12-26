{ inputs, outputs, config, ...}:

{
  imports = [
    # Get all User information.
    ../services/default.nix
    ../user/default.nix
    ./gc.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";

}