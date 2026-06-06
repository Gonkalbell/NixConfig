{ self, inputs, ... }:
{
  flake.homeModules.gonkalModule =
    { pkgs, ... }:
    {
      imports = [
        self.homeModules.neovim
        self.homeModules.stylix
      ];

      home = {
        stateVersion = "24.11";
        packages = with pkgs; [
          curl
          discord
          godot_4
          nil
          nixfmt
          wget
        ];

        sessionVariables = {
          EDITOR = "nvim";
        };

        shell.enableFishIntegration = true;
      };

      programs = {
        home-manager.enable = true;

        direnv.enable = true;

        fish = {
          enable = true;
          interactiveShellInit = ''
            starship init fish | source
          '';
        };

        git = {
          enable = true;
          lfs.enable = true;
          settings.user.email = "johnmichaelbell@gmal.org";
          settings.user.name = "John Michael Bell";
        };

        nix-index = {
          enable = true;
          enableBashIntegration = true;
          enableFishIntegration = true;
        };

        ripgrep.enable = true;

        starship.enable = true;

        vscode.enable = true;
      };

      targets.genericLinux = {
        enable = true;
        gpu.enable = true;
      };
    };
}
