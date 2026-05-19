{ self, inputs, ... }:
{
  flake.homeManagerModules.home =
    {
      pkgs,
      inputs,
      config,
      ...
    }:
    {
      imports = [ ];

      home = {
        username = "gonkal";
        homeDirectory = "/home/gonkal";
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
    };
}
