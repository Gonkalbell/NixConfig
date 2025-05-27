# Gonkal's Nix Configuration

I don't understand nix, so I'm uploading my configuration to github so I can get help.

A lot of this config is based on vimjoyer's tutorial: https://youtu.be/a67Sv4Mbxmc

# Some questions I have

- Why does the default `flake.nix` made from `nix flake init` not need `stdenv.mkDerivation` or `stdenv.mkShell`?
- What goes in configuration.nix, what goes in flake.nix, and what goes in home.nix?
- Why do I have errors if I put steam in home.nix instead of configuration.nix?
- What should I do if I want to use this config across multiple 