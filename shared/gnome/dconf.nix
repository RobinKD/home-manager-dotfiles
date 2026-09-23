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

  "org/gnome/desktop/wm/keybindings" = {
    begin-resize = [ "<Super>r" ];
    close = [ "<Super>q" ];
    lower = [ "<Super>comma" ];
    move-to-monitor-down = [ "<Shift><Super>Down" ];
    move-to-monitor-left = [ "<Shift><Super>Left" ];
    move-to-monitor-right = [ "<Shift><Super>Right" ];
    move-to-monitor-up = [ "<Shift><Super>Up" ];
    raise-or-lower = [ "<Super>period" ];
    toggle-fullscreen = [ "<Shift><Super>f" ];
    toggle-maximized = [ "<Super>m" ];
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
      "soft-brightness-plus@joelkitching.com"
      "night-light-scheduler@storageb.github.com"
      "multi-monitors-bar@frederykabryan"
      "appindicatorsupport@rgcjonas.gmail.com"
      "sound-output-organizer@sound-output-organizer"
      "Vitals@CoreCoding.com"
      "advanced-alt-tab@G-dH.github.com"
      "mouse-follows-focus@crisidev.org"
    ];
    favorite-apps = [
      "firefox.desktop"
      "librewolf.desktop"
      "emacs-emacs.desktop"
      "org.signal.Signal.desktop"
      "com.discordapp.Discord.desktop"
      "com.tradingview.tradingview.desktop"
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

  "org/gnome/shell/extensions/advanced-alt-tab-window-switcher" = {
    hot-edge-fullscreen = false;
    super-key-mode = 1;
    switcher-popup-pointer-timeout = 600;
    switcher-popup-start-search = false;
    win-switcher-popup-filter = 1;
  };

  "org/gnome/shell/extensions/mouse-follows-focus" = {
    bottom-bar-height = 0;
    top-bar-height = 0;
  };

  "org/gnome/shell/keybindings" = {
    switch-to-application-1 = [ "<Super>1" ];
    switch-to-application-2 = [ "<Super>2" ];
    close = [ "<Super>q" ];
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
