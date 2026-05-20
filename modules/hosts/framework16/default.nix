{ self, inputs, ... }:
{
  flake.nixosConfigurations.framework16 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.framework16Configuration
      inputs.home-manager.nixosModules.home-manager
      inputs.nixos-hardware.nixosModules.framework-16-7040-amd
      inputs.nix-index-database.nixosModules.default
    ];
  };
}
