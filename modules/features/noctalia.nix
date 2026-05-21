{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      pkgsAllowUnfree = import inputs.nixpkgs {
        inherit (pkgs) system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        pkgs = pkgsAllowUnfree;
        # settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;
      };
    };
}
