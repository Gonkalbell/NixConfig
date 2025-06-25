{ pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.discover
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kcolorchooser
    kdePackages.kolourpaint
    kdePackages.ksystemlog
    kdePackages.sddm-kcm
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    kdePackages.yakuake
    wayland-utils
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  hardware.bluetooth.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  imports = [ ./hardware-configuration.nix ];

  networking = {
    hostName = "framework";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    firefox.enable = true;
    fish.enable = true;
    niri.enable = true;
    nix-ld.enable = true;
    partition-manager.enable = true;
    steam.enable = true;
    xwayland.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    printing.enable = true;
    openssh.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  system.stateVersion = "24.11"; # DO NOT CHANGE!!!

  time.timeZone = "America/New_York";

  users.users.gonkal = {
    isNormalUser = true;
    description = "gonkal";
    initialHashedPassword = "$y$j9T$GxAEfu3uXuqfEr.q3f0Gj.$yT9CHt0X2FQasBg4yI3.mN1OdslT5MvGps.dVjz9.z";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    shell = pkgs.fish;
  };
}
