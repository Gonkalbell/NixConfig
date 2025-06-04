# Gonkal's Nix Configuration

I don't understand nix, so I'm uploading my configuration to github so I can get help.

A lot of this config is based on vimjoyer's tutorial: https://youtu.be/a67Sv4Mbxmc

## Some questions I have

- Why does the default `flake.nix` made from `nix flake init` not need `stdenv.mkDerivation` or `stdenv.mkShell`?
- What goes in configuration.nix, what goes in flake.nix, and what goes in home.nix?
- Why do I have errors if I put steam in home.nix instead of configuration.nix?
- What should I do if I want to use this config across multiple machines (framework 16, chromebook with Crostini, raspberry pi 400, steamdeck with steamOS)

## Editor

- VSCode:
  - Should I use VSCode or VSCodium
  - Should I use extensions for nix packages, or use the extensions tab?
  - use nix environment switcher or direnv?
  - XML extension issue:```
    Could not start dynamically linked executable: /home/gonkal/.vscode/extensions/redhat.vscode-xml-0.29.0-linux-x64/server/lemminx-linux
      NixOS cannot run dynamically linked executables intended for generic
      linux environments out of the box. For more information, see:
      https://nix.dev/permalink/stub-ld```
  - Jupyter notebooks? Or a repl for Jupyter
- Other options: Kate, rust-rover, neovim, helix
  - Git comparison view
  - integrated terminal
  - bracket coloring
  - go to symbol / symbol search

## Desktop environment

- should I use tiling or floating windows?
- Features I always want in a desktop environment:
  - copy-paste history!
  - screenshot & video record
  - nightlight
  - show battery %, CPU Heat, CPU %, GPU Heat, GPU %, Volume, maybe network + disk?
- check dotfiles into git vs use home-manager?