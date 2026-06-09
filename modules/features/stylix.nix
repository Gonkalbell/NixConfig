{ self, inputs, ... }:
{
  flake.nixosModules.stylix =
    { pkgs, ... }:
    {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];

      stylix = {
        enable = true;
        enableReleaseChecks = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
      };
    };
}
