# Gonkal's Nix Configuration

I don't understand nix, so I'm uploading my configuration to github so I can get help.

A lot of this config is based on vimjoyer's tutorial: https://youtu.be/a67Sv4Mbxmc

## TODO

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
- Other options: Kate, rust-rover, neovim, helix. I need these features
  - Git comparison view
  - integrated terminal
  - bracket coloring
  - go to symbol / symbol search

## Niri config issues

- vscode and steam don't launch
- can't use network manager
- I want 2 finger click for right-click
- `waybar.enable` launches waybar on initialization, even in KDE. If niri also launches waybar, there are 2 bars

## Desktop environment

- should I use tiling or floating windows?
- Features I always want in a desktop environment:
  - copy-paste history!
  - screenshot & video record
  - nightlight
  - show battery %, CPU Heat, CPU %, GPU Heat, GPU %, Volume, maybe network + disk?
- check dotfiles into git vs use home-manager?