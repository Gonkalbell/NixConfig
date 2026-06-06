{ self, inputs, ... }:
{
  flake.homeModules.stylix =
    { pkgs, ... }:
    {
      imports = [
        inputs.stylix.homeModules.stylix
      ];

      stylix = {
        enable = true;
        enableReleaseChecks = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
        targets = {
          kitty.enable = true;
          neovim.enable = true;
          noctalia-shell.enable = true;
          vscode.enable = false;
        };
      };
    };
}
