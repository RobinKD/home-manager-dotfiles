# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  "org/gnome/desktop/input-sources" = {
    current = mkUint32 0;
    sources = [
      (mkTuple [
        "xkb"
        "us"
      ])
    ];
    xkb-options = [
      "lv3:ralt_alt"
      "compose:ralt"
    ];
  };

  "org/gnome/desktop/interface" = {
    accent-color = "teal";
    color-scheme = "default";
    enable-hot-corners = false;
    locate-pointer = true;
    toolkit-accessibility = false;
  };

  "org/gnome/desktop/notifications" = {
    show-banners = true;
  };

  "org/gnome/desktop/privacy" = {
    report-technical-problems = false;
  };

  "org/gnome/desktop/sound" = {
    event-sounds = false;
    theme-name = "__custom";
  };

  "org/gnome/desktop/wm/preferences" = {
    focus-mode = "sloppy";
  };

  "org/gnome/settings-daemon/plugins/color" = {
    night-light-enabled = true;
    night-light-schedule-automatic = false;
    night-light-temperature = mkUint32 5000;
  };

  "org/gnome/settings-daemon/plugins/media-keys" = {
    custom-keybindings = [
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
    ];
    screensaver = [ "<Alt><Super>l" ];
    shutdown = [ "<Alt><Super>p" ];
  };

  "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
    binding = "<Super>e";
    command = "distrobox enter emacs -- emacsclient -c";
    name = "Emacs";
  };

  "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
    binding = "<Super>Return";
    command = "ptyxis --new-window";
    name = "Terminal";
  };

  "org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = [
      "mouse-follows-focus@crisidev.org"
      "soft-brightness-plus@joelkitching.com"
      "night-light-scheduler@storageb.github.com"
      "multi-monitors-bar@frederykabryan"
      "appindicatorsupport@rgcjonas.gmail.com"
      "sound-output-organizer@sound-output-organizer"
      "Vitals@CoreCoding.com"
      "paperwm@paperwm.github.com"
    ];
    favorite-apps = [
      "firefox.desktop"
      "librewolf.desktop"
      "emacs-emacs.desktop"
      "org.signal.Signal.desktop"
      "com.discordapp.Discord.desktop"
      "com.tradingview.tradingview.desktop"
      "org.gnome.Nautilus.desktop"
      "org.gnome.Ptyxis.desktop"
    ];
  };

  "org/gnome/shell/extensions/appindicator" = {
    legacy-tray-enabled = true;
  };

  "org/gnome/shell/extensions/multi-monitors-bar" = {
    available-indicators = [ ];
    force-workspaces-on-all-displays = false;
    show-activities = false;
    show-app-menu = true;
    show-date-time = true;
    show-panel = true;
  };

  "org/gnome/shell/extensions/night-light-scheduler" = {
    schedule = [
      (mkTuple [
        (mkUint32 0)
        (mkUint32 0)
        (mkUint32 2700)
      ])
      (mkTuple [
        9
        0
        5000
      ])
      (mkTuple [
        20
        0
        2700
      ])
    ];
    transition-time = 120;
  };

  "org/gnome/shell/extensions/soft-brightness-plus" = {
    clone-mouse = false;
  };

  "org/gnome/shell/extensions/sound-output-organizer" = {
    show-volume-levels = true;
  };

  "org/gnome/shell/extensions/vitals" = {
    alphabetize = false;
    fixed-widths = false;
    hide-icons = false;
    icon-style = 0;
    include-static-info = false;
    menu-centered = false;
    show-system = true;
    update-time = 10;
    use-higher-precision = false;
    hot-sensors = [
      "_memory_usage_"
      "_processor_usage_"
      "__network-rx_max__"
    ];
  };

  "org/gnome/shell/extensions/paperwm" = {
    cycle-height-steps = [
      0.382
      0.5
      0.618
      1.0
    ];
    cycle-width-steps = [
      0.382
      0.5
      0.618
      1.0
    ];
    disable-topbar-styling = false;
    edge-preview-enable = true;
    edge-preview-scale = 0.15;
    gesture-enabled = false;
    gesture-workspace-fingers = 4;
    horizontal-margin = 1;
    last-used-display-server = "Wayland";
    maximize-within-tiling = true;
    minimap-scale = 0.15;
    restore-attach-modal-dialogs = "true";
    restore-edge-tiling = "true";
    restore-keybinds = ''{"toggle-tiled-left":{"bind":"[\\"<Super>Left\\"]","schema_id":"org.gnome.mutter.keybindings"},"toggle-tiled-right":{"bind":"[\\"<Super>Right\\"]","schema_id":"org.gnome.mutter.keybindings"},"cancel-input-capture":{"bind":"[\\"<Super><Shift>Escape\\"]","schema_id":"org.gnome.mutter.keybindings"},"restore-shortcuts":{"bind":"[\\"<Super>Escape\\"]","schema_id":"org.gnome.mutter.wayland.keybindings"},"switch-to-workspace-last":{"bind":"[\\"<Super>End\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-panels":{"bind":"[\\"<Control><Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-group-backward":{"bind":"[\\"<Shift><Super>Above_Tab\\",\\"<Shift><Alt>Above_Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"lower":{"bind":"[\\"<Super>Down\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-1":{"bind":"[\\"<Super>Home\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-monitor-left":{"bind":"[\\"<Super><Shift>Left\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-monitor-down":{"bind":"[\\"<Super><Shift>Down\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-left":{"bind":"[\\"<Super>Page_Up\\",\\"<Super>KP_Prior\\",\\"<Super><Alt>Left\\",\\"<Control><Alt>Left\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"toggle-fullscreen":{"bind":"[\\"<Super>f\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-group":{"bind":"[\\"<Super>Above_Tab\\",\\"<Alt>Above_Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-left":{"bind":"[\\"<Super><Shift>Page_Up\\",\\"<Super><Shift>KP_Prior\\",\\"<Super><Shift><Alt>Left\\",\\"<Control><Shift><Alt>Left\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-right":{"bind":"[\\"<Super><Shift>Page_Down\\",\\"<Super><Shift>KP_Next\\",\\"<Super><Shift><Alt>Right\\",\\"<Control><Shift><Alt>Right\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-panels-backward":{"bind":"[\\"<Shift><Control><Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-up":{"bind":"[\\"<Control><Shift><Alt>Up\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-right":{"bind":"[\\"<Super>Page_Down\\",\\"<Super>KP_Next\\",\\"<Super><Alt>Right\\",\\"<Control><Alt>Right\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-down":{"bind":"[\\"<Control><Shift><Alt>Down\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-applications":{"bind":"[\\"<Super>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-windows":{"bind":"[\\"<Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"raise-or-lower":{"bind":"[\\"<Super>Up\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-monitor-right":{"bind":"[\\"<Super><Shift>Right\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-applications-backward":{"bind":"[\\"<Shift><Super>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-windows-backward":{"bind":"[\\"<Shift><Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-monitor-up":{"bind":"[\\"<Super><Shift>Up\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"shift-overview-up":{"bind":"[\\"<Super><Alt>Up\\"]","schema_id":"org.gnome.shell.keybindings"},"shift-overview-down":{"bind":"[\\"<Super><Alt>Down\\"]","schema_id":"org.gnome.shell.keybindings"},"focus-active-notification":{"bind":"[\\"<Super>n\\"]","schema_id":"org.gnome.shell.keybindings"},"rotate-video-lock-static":{"bind":"[\\"<Super>o\\",\\"XF86RotationLockToggle\\"]","schema_id":"org.gnome.settings-daemon.plugins.media-keys"}}'';
    restore-workspaces-only-on-primary = "true";
    selection-border-radius-top = 0;
    selection-border-size = 0;
    show-focus-mode-icon = false;
    show-open-position-icon = false;
    show-window-position-bar = false;
    vertical-margin = 1;
    vertical-margin-bottom = 1;
    window-gap = 1;
  };

  "org/gnome/shell/extensions/paperwm/keybindings" = {
    close-window = [ "<Super>q" ];
    move-left = [ "<Shift><Super>comma" ];
    move-right = [ "<Shift><Super>period" ];
    new-window = [ "<Super>n" ];
    resize-h-dec = [ "<Shift><Super>underscore" ];
    resize-w-inc = [ "<Super>equal" ];
    toggle-scratch = [ "<Control><Super>s" ];
  };

  "org/gnome/shell/keybindings" = {
    switch-to-application-1 = [ "<Super>1" ];
    switch-to-application-2 = [ "<Super>2" ];
    toggle-message-tray = [ ];
  };

  "org/gnome/system/location" = {
    enabled = false;
  };

  "org/gnome/tweaks" = {
    show-extensions-notice = false;
  };

  "org/gtk/gtk4/settings/file-chooser" = {
    show-hidden = true;
    sort-directories-first = false;
  };
}
