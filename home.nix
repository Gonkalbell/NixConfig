{ pkgs, ... }:

{
  home = {
    username = "gonkal";
    homeDirectory = "/home/gonkal";
    stateVersion = "24.11";

    packages = with pkgs; [
      alacritty
      curl
      discord
      godot_4
      nil
      nixfmt-rfc-style
      wget
      xwayland-satellite
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    shell.enableFishIntegration = true;
  };

  services = {
    gnome-keyring.enable = true;
    mako.enable = true;
  };

  programs = {
    direnv.enable = true;

    fish = {
      enable = true;
      interactiveShellInit = ''
        starship init fish | source
      '';
    };

    fuzzel.enable = true;

    git = {
      enable = true;
      userEmail = "johnmichaelbell@gmal.org";
      userName = "John Michael Bell";
    };

    home-manager.enable = true;

    jq.enable = true;

    neovim.enable = true;

    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    ripgrep.enable = true;

    starship.enable = true;

    vscode.enable = true;

    waybar = {
      enable = true;
      systemd.target = "niri-session";
    };

    wofi.enable = true;
  };

  xdg.configFile = {
    niri.source = ./dotfiles/.config/niri;
    waybar.source = ./dotfiles/.config/waybar;
  };
}
