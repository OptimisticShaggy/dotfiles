{ inputs, outputs, config, ...}:

{
  imports = [
    # Get all User information.
    ../services/default.nix
    ../user/default.nix
    ./gc.nix
  ];

}