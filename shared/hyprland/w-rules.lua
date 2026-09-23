-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

hl.window_rule({
	name = "transparent-emacs-terminal",
	match = {
		class = "^(.*Emacs.*|.*kitty.*)$",
	},
	opacity = "0.90 override 0.85 override",
})
hl.window_rule({
	name = "special-workspace-emacs",
	match = {
		class = "^.*Emacs.*$",
	},
	workspace = "special:Emacs",
})
hl.window_rule({
	name = "special-workspace-term",
	match = {
		class = "^.*kitty.*$",
	},
	workspace = "special:Term",
})

hl.window_rule({
	name = "noBorderFloat",
	match = {
		float = true,
		focus = false,
	},
	border_size = 0,
})

hl.window_rule({
	name = "alwaysFloat",
	match = {
		title = "^(Picture-in-Picture|.*kitty.*)$",
	},
	float = true,
})
