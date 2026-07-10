{ self, inputs, ... }:
{
  flake.homeModules.gonkalModule =
    { pkgs, config, ... }:
    {
      imports = [
        self.homeModules.neovim
        inputs.nix-index-database.homeModules.default
      ];

      home = {
        stateVersion = "24.11";
        packages = with pkgs; [
          curl
          discord
          freerdp
          godot_4
          nil
          nixfmt
          openvpn
          slack
          wget
        ];

        sessionVariables = {
          EDITOR = "nvim";
        };
      };

      programs = {
        home-manager.enable = true;

        direnv = {
          enable = true;
          enableFishIntegration = true;
        };

        firefox = {
          enable = true;
          configPath = "${config.xdg.configHome}/mozilla/firefox";
        };

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

        nix-index-database.comma.enable = true;

        ripgrep.enable = true;

        starship.enable = true;

        vscode.enable = true;
      };

      services.remmina.enable = true;

      targets.genericLinux = {
        enable = true;
        gpu.enable = true;
      };
    };
}
