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
    ];
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  services = {
    gnome-keyring.enable = true;
    mako.enable = true;
  };

  programs = {
    direnv.enable = true;
    jq.enable = true;
    neovim.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    vscode.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        starship init fish | source
      '';
    };
    git = {
      enable = true;
      userEmail = "johnmichaelbell@gmal.org";
      userName = "John Michael Bell";
    };

    fuzzel.enable = true;

    waybar = {
      enable = false;
      systemd.enable = true;
    };

    home-manager.enable = true;
  };
}
