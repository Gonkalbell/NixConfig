{ self, inputs, ... }:
{
  flake = {
    nixosModules.stylix =
      { pkgs, ... }:
      {
        imports = [
          inputs.stylix.nixosModules.stylix
        ];

        stylix = {
          enable = true;
          enableReleaseChecks = false;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
          homeManagerIntegration.autoImport = false;
        };
      };

    homeModules.stylix =
      { pkgs, ... }:
      {
        imports = [
          inputs.stylix.homeModules.stylix
        ];

        stylix.targets.vscode.enable = false;

      };
  };
}
