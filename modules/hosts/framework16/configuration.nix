# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ self, inputs, ... }:
{
  flake.nixosModules.framework16Configuration =
    { inputs, pkgs, ... }:
    {
      imports = [
        self.nixosModules.framework16Hardware
        self.nixosModules.niri
        self.nixosModules.stylix
      ];

      boot.loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 10;
        };
        efi.canTouchEfiVariables = true;
      };

      environment.systemPackages = with pkgs; [
        wayland-utils
        wl-clipboard
        hplipWithPlugin
      ];

      fonts.packages = with pkgs; [
        font-awesome
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        nerd-fonts.caskaydia-cove
      ];

      hardware.bluetooth.enable = true;

      home-manager = {
        backupFileExtension = "backup";
        users.gonkal = self.homeModules.gonkalModule;
      };

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

      networking = {
        hostName = "framework";
        networkmanager = {
          enable = true;
          wifi.powersave = false;
        };
      };

      nix = {
        settings = {
          auto-optimise-store = true;
          experimental-features = [
            "nix-command"
            "flakes"
          ];
        };

        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 1w";
        };
      };

      nixpkgs.config.allowUnfree = true;

      programs = {
        appimage = {
          enable = true;
          binfmt = true;
        };

        fish.enable = true;

        nh = {
          enable = true;
          flake = "/home/gonkal/nixos#framework16";
        };

        nix-ld.enable = true;

        steam = {
          enable = true;
          package = pkgs.steam.override {
            extraEnv = {
              DRI_PRIME = "1";
            };
          };
        };

        xwayland.enable = true;
      };

      security.rtkit.enable = true;

      services = {
        avahi = {
          enable = true;
          nssmdns4 = true;
        };

        displayManager.lemurs.enable = true;

        openssh.enable = true;

        printing = {
          enable = true;
          drivers = [ pkgs.hplipWithPlugin ];
        };

        pulseaudio.enable = false;

        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };

        xserver = {
          enable = true;
          xkb = {
            layout = "us";
            variant = "";
          };
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

    };

}
