{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.niri =
    { pkgs, lib, ... }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
      };
    };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;

        v2-settings = true;

        "config.kdl".content = ''

          input {
            keyboard {
              xkb { layout "us,ua"; }
              numlock
            }
            touchpad {
              accel-speed 0.2
              click-method "clickfinger"
              drag true
              scroll-method "two-finger"
            }
          }

          gestures { hot-corners { off; }; }

          output "BOE 0x0BC9 Unknown" { scale 1; }

          layout { gaps 8; }

          spawn-at-startup "${lib.getExe self'.packages.myNoctalia}"
          xwayland-satellite { path "${lib.getExe pkgs.xwayland-satellite}"; }

          binds {
            Mod+Shift+Slash { show-hotkey-overlay; }

            XF86AudioRaiseVolume { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
            XF86AudioLowerVolume { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
            XF86AudioMute { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
            XF86AudioMicMute { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

            XF86AudioPlay { spawn-sh "${lib.getExe pkgs.playerctl} play-pause"; }
            XF86AudioStop { spawn-sh "${lib.getExe pkgs.playerctl} stop"; }
            XF86AudioNext { spawn-sh "${lib.getExe pkgs.playerctl} next"; }
            XF86AudioPrev { spawn-sh "${lib.getExe pkgs.playerctl} previous"; }

            XF86MonBrightnessUp { spawn "${lib.getExe pkgs.brightnessctl}" "--class=backlight" "set" "+10%"; }
            XF86MonBrightnessDown { spawn "${lib.getExe pkgs.brightnessctl}" "--class=backlight" "set" "10%-"; }

            Mod+O { toggle-overview; }
            Mod+Q { close-window; }
            Mod+Return hotkey-overlay-title="Launch Kitty Terminal" { spawn "${lib.getExe pkgs.kitty}"; }
            Mod+Space hotkey-overlay-title="Launcher" { spawn "${lib.getExe pkgs.noctalia-shell}" "ipc" "call" "launcher" "toggle"; }
            Mod+Shift+Space hotkey-overlay-title="Window Selector" { spawn "${lib.getExe pkgs.noctalia-shell}" "ipc" "call" "launcher" "windows"; }
            Mod+Period hotkey-overlay-title="Emoji Selector" { spawn "${lib.getExe pkgs.noctalia-shell}" "ipc" "call" "launcher" "emoji"; }
            Mod+Shift+Period hotkey-overlay-title="Run Command" { spawn "${lib.getExe pkgs.noctalia-shell}" "ipc" "call" "launcher" "command"; }
            Mod+V hotkey-overlay-title="Clipboard history" { spawn "${lib.getExe pkgs.noctalia-shell}" "ipc" "call" "launcher" "clipboard"; }

            Mod+Left { focus-column-left; }
            Mod+Down { focus-window-down; }
            Mod+Up { focus-window-up; }
            Mod+Right { focus-column-right; }
            Mod+H { focus-column-left; }
            Mod+J { focus-window-down; }
            Mod+K { focus-window-up; }
            Mod+L { focus-column-right; }

            Mod+Shift+Left { move-column-left; }
            Mod+Shift+Down { move-window-down; }
            Mod+Shift+Up { move-window-up; }
            Mod+Shift+Right { move-column-right; }
            Mod+Shift+H { move-column-left; }
            Mod+Shift+J { move-window-down; }
            Mod+Shift+K { move-window-up; }
            Mod+Shift+L { move-column-right; }

            Mod+Home { focus-column-first; }
            Mod+End { focus-column-last; }
            Mod+Ctrl+Home { move-column-to-first; }
            Mod+Ctrl+End { move-column-to-last; }

            Mod+Page_Down { focus-workspace-down; }
            Mod+Page_Up { focus-workspace-up; }
            Mod+U { focus-workspace-down; }
            Mod+I { focus-workspace-up; }

            Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
            Mod+Ctrl+Page_Up { move-column-to-workspace-up; }
            Mod+Ctrl+U { move-column-to-workspace-down; }
            Mod+Ctrl+I { move-column-to-workspace-up; }

            Mod+Shift+Page_Down { move-workspace-down; }
            Mod+Shift+Page_Up { move-workspace-up; }
            Mod+Shift+U { move-workspace-down; }
            Mod+Shift+I { move-workspace-up; }

            Mod+WheelScrollDown { focus-workspace-down; }
            Mod+WheelScrollUp { focus-workspace-up; }
            Mod+Ctrl+WheelScrollDown { move-column-to-workspace-down; }
            Mod+Ctrl+WheelScrollUp { move-column-to-workspace-up; }

            Mod+WheelScrollRight { focus-column-right; }
            Mod+WheelScrollLeft { focus-column-left; }
            Mod+Ctrl+WheelScrollRight { move-column-right; }
            Mod+Ctrl+WheelScrollLeft { move-column-left; }

            Mod+Shift+WheelScrollDown { focus-column-right; }
            Mod+Shift+WheelScrollUp { focus-column-left; }
            Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
            Mod+Ctrl+Shift+WheelScrollUp { move-column-left; }

            Mod+1 { focus-workspace 1; }
            Mod+2 { focus-workspace 2; }
            Mod+3 { focus-workspace 3; }
            Mod+4 { focus-workspace 4; }
            Mod+5 { focus-workspace 5; }
            Mod+6 { focus-workspace 6; }
            Mod+7 { focus-workspace 7; }
            Mod+8 { focus-workspace 8; }
            Mod+9 { focus-workspace 9; }
            Mod+Ctrl+1 { move-column-to-workspace 1; }
            Mod+Ctrl+2 { move-column-to-workspace 2; }
            Mod+Ctrl+3 { move-column-to-workspace 3; }
            Mod+Ctrl+4 { move-column-to-workspace 4; }
            Mod+Ctrl+5 { move-column-to-workspace 5; }
            Mod+Ctrl+6 { move-column-to-workspace 6; }
            Mod+Ctrl+7 { move-column-to-workspace 7; }
            Mod+Ctrl+8 { move-column-to-workspace 8; }
            Mod+Ctrl+9 { move-column-to-workspace 9; }

            Mod+Ctrl+Left { consume-or-expel-window-left; }
            Mod+Ctrl+Right { consume-or-expel-window-right; }
            Mod+Ctrl+Down { consume-window-into-column; }
            Mod+Ctrl+Up { expel-window-from-column; }

            Mod+R { switch-preset-column-width; }
            Mod+Shift+R { switch-preset-column-width-back; }
            Mod+Ctrl+R { reset-window-height; }
            Mod+Ctrl+Shift+R { switch-preset-window-height; }

            Mod+F { maximize-column; }
            Mod+Shift+F { fullscreen-window; }
            Mod+Ctrl+F { expand-column-to-available-width; }

            Mod+M { maximize-window-to-edges; }
            Mod+C { center-column; }
            Mod+Ctrl+C { center-visible-columns; }

            Mod+Minus { set-column-width "-10%"; }
            Mod+Equal { set-column-width "+10%"; }
            Mod+Shift+Minus { set-window-height "-10%"; }
            Mod+Shift+Equal { set-window-height "+10%"; }

            Mod+Ctrl+V { toggle-window-floating; }
            Mod+Shift+V { switch-focus-between-floating-and-tiling; }

            Mod+W { toggle-column-tabbed-display; }

            Print { screenshot; }
            Alt+Print { screenshot-window; }
            Ctrl+Print { screenshot-screen; }

            Mod+Escape { toggle-keyboard-shortcuts-inhibit; }
            Mod+Shift+E { quit; }
            Ctrl+Alt+Delete { quit; }
            Mod+Shift+P { power-off-monitors; }
          }
        '';
      };
    };
}
