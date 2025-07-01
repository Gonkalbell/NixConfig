# Gonkal's Nix Configuration

I don't understand nix, so I'm uploading my configuration to github so I can get help.

A lot of this config is based on these tutorials:
  - https://youtu.be/a67Sv4Mbxmc
  - https://nixos-and-flakes.thiscute.world/nixpkgs/intro

## TODO

- What should I do if I want to use this config across multiple machines (framework 16, chromebook with Crostini, raspberry pi 400, steamdeck with steamOS)

- Rice my NIRI DE and fix some bugs
  - add background
  - see why xwayland-satellite apps are too zoomed in
  - see why steam won't launch
  - copy-paste history!
  - screenshot & video record
  - nightlight
  - either hide client-side-decorations, or make them control niri windows

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
  - browse files
  - go back / forward to previous line / file
