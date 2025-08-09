{
  pkgs,
  config,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    swayosd
    wl-clipboard
    wayland-utils
    libsecret
    xwayland-satellite-unstable
    playerctl
    pwvucontrol
  ];

  programs.swaylock = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./swaylock.json);
  };

  services.mako = {
    enable = true;
    settings = {
      sort = "+time";
      on-button-left = "invoke-default-action";
      on-button-middle = "dismiss-group";
      on-button-right = "dismiss";
      on-touch = "invoke-default-action";
      height = 99;
      width = 299;
      margin = 0;
      padding = 10;
      border-size = 1;
      border-radius = 1;
      icons = 1;
      layer = "top";
      anchor = "bottom-right";
      markup = 1;
      actions = 1;
      text-alignment = "center";
      default-timeout = 10000;
    };
  };
  services.swayosd = {
    enable = true;
  };
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [
      (builtins.fromJSON (builtins.readFile ./waybar.json))
    ];
    style = builtins.readFile ./waybar.css;
  };

  programs.fuzzel.enable = true;

  services.wpaperd.enable = true;
  # programs.niri.config = builtins.readFile ./config.kdl;
  programs.niri.settings = {

    cursor = lib.mkIf (config.stylix.cursor != null) {
      size = config.stylix.cursor.size;
      theme = config.stylix.cursor.name;
    };

    prefer-no-csd = true;
    spawn-at-startup = [
      { command = [ "wpaperd" ]; }
    ];

    window-rules = [
      {
        geometry-corner-radius =
          let
            r = 8.0;
          in
          {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };
        clip-to-geometry = true;
      }
    ];

    hotkey-overlay.skip-at-startup = true;

    input = {
      keyboard = {
        xkb.layout = "it";
        xkb.options = "caps:capslock";
        track-layout = "global";
      };
      touchpad = {
        natural-scroll = true;
        scroll-method = "two-finger";
        click-method = "button-areas";
      };
      mouse = {
        accel-speed = -0.8;
      };
      focus-follows-mouse.enable = true;
      focus-follows-mouse.max-scroll-amount = "5%";
    };

    layout = {
      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
      ];
      default-column-width.proportion = 1.0 / 2.0;
      focus-ring = {
        active.color = "#8d4eef";
        inactive.color = "#505050";
      };
    };

    binds = with config.lib.niri.actions; {
      "XF86AudioRaiseVolume" = {
        action.spawn = [
          "swayosd-client"
          "--output-volume=raise"
        ];
        allow-when-locked = true;
      };
      "XF86AudioLowerVolume" = {
        action.spawn = [
          "swayosd-client"
          "--output-volume=lower"
        ];
        allow-when-locked = true;
      };
      "XF86AudioMute" = {
        action.spawn = [
          "swayosd-client"
          "--output-volume=mute-toggle"
        ];
        allow-when-locked = true;
      };
      "XF86AudioMicMute" = {
        action.spawn = [
          "swayosd-client"
          "--input-volume=mute-toggle"
        ];
        allow-when-locked = true;
      };
      "XF86MonBrightnessUp" = {
        action.spawn = [
          "swayosd-client"
          "--brightness=raise"
        ];
        allow-when-locked = true;
      };
      "XF86MonBrightnessDown" = {
        action.spawn = [
          "swayosd-client"
          "--brightness=lower"
        ];
        allow-when-locked = true;
      };

      "XF86AudioPlay" = {
        action.spawn = [
          "playerctl"
          "play-pause"
        ];
        allow-when-locked = true;
      };
      "XF86AudioStop" = {
        action.spawn = [
          "playerctl"
          "stop"
        ];
        allow-when-locked = true;
      };
      "XF86AudioPrev" = {
        action.spawn = [
          "playerctl"
          "previous"
        ];
        allow-when-locked = true;
      };
      "XF86AudioNext" = {
        action.spawn = [
          "playerctl"
          "next"
        ];
        allow-when-locked = true;
      };

      "Mod+T".action.spawn = "ghostty";
      "Mod+D".action.spawn = "fuzzel";
      "Mod+Q".action = close-window;

      "Mod+Ctrl+Left".action = move-column-left;
      "Mod+Ctrl+Right".action = move-column-right;
      "Mod+Ctrl+Up".action = move-window-up;
      "Mod+Ctrl+Down".action = move-window-down;

      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Up".action = focus-window-up;
      "Mod+Down".action = focus-window-down;

      "Mod+Page_Down".action = focus-workspace-down;
      "Mod+Page_Up".action = focus-workspace-up;

      "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
      "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;

      "Mod+WheelScrollDown" = {
        action = focus-workspace-down;
        cooldown-ms = 150;
      };
      "Mod+WheelScrollUp" = {
        action = focus-workspace-up;
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollDown" = {
        action = move-column-to-workspace-down;
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollUp" = {
        action = move-column-to-workspace-up;
        cooldown-ms = 150;
      };

      "Mod+R".action = switch-preset-column-width;
      "Mod+Shift+R".action = switch-preset-window-height;
      "Mod+Ctrl+R".action = reset-window-height;

      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;

      "Mod+C".action = center-column;
      "Mod+V".action = toggle-window-floating;
      "Print".action = screenshot;
    };
  };
}
