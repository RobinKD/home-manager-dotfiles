---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "nautilus"

---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- 1. System binds
local ipc = "noctalia msg "
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close window" })

hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill(), { description = "Force kill window" })
hl.bind(mainMod .. "+ ALT + P", hl.dsp.exec_cmd(ipc .. "session shutdown"), { description = "Shut down system" })
hl.bind(mainMod .. "+ ALT + X", hl.dsp.exec_cmd(ipc .. "session logout"), { description = "Log out of session" })
hl.bind(mainMod .. "+ ALT + L", hl.dsp.exec_cmd(ipc .. "session lock"), { description = "Lock session" })
hl.bind(
	mainMod .. "+ SHIFT + H",
	hl.dsp.exec_cmd(ipc .. "panel-toggle kenn/keybind-cheatsheet:cheatsheet"),
	{ description = "Show keybind cheatsheet" }
)

-- 2. App binds
local emacs = "distrobox enter emacs -- "

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(
	mainMod .. " + SHIFT + Return",
	hl.dsp.workspace.toggle_special("Term"),
	{ description = "Toggle terminal special workspace" }
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(emacs .. "emacsclient -c -a emacs"), { description = "Open Emacs client" })
hl.bind(
	mainMod .. " + SHIFT + E",
	hl.dsp.workspace.toggle_special("Emacs"),
	{ description = "Toggle Emacs special workspace" }
)
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(fileManager), { description = "Open file manager" })
hl.bind(
	mainMod .. "+Space",
	hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"),
	{ description = "Toggle application launcher" }
)
hl.bind(
	mainMod .. "+C",
	hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"),
	{ description = "Toggle control center" }
)
hl.bind(mainMod .. "+ SHIFT + C", hl.dsp.exec_cmd(ipc .. "settings-toggle"), { description = "Toggle settings" })
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher"), { description = "Open window switcher" })

-- 3. Window handling
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating window" })
hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"), { description = "Increase column width" })
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.layout("colresize -conf"), { description = "Decrease column width" })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.layout("move -col"), { description = "Focus window to the left" })
hl.bind(mainMod .. " + right", hl.dsp.layout("move +col"), { description = "Focus window to the right" })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.layout("swapcol l"), { description = "Swap window with the left" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.layout("swapcol r"), { description = "Swap window with the right" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Move window", mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize window", mouse = true })

-- 4. Monitor handling
hl.bind(mainMod .. " + comma", hl.dsp.focus({ monitor = "-1" }), { description = "Focus previous monitor" })
hl.bind(mainMod .. " + period", hl.dsp.focus({ monitor = "+1" }), { description = "Focus next monitor" })
hl.bind(
	mainMod .. " + SHIFT + comma",
	hl.dsp.workspace.move({ monitor = "-1" }),
	{ description = "Move workspace to previous monitor" }
)
hl.bind(
	mainMod .. " + SHIFT + period",
	hl.dsp.workspace.move({ monitor = "+1" }),
	{ description = "Move workspace to next monitor" }
)

-- 5. Workspace handling
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0

	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to workspace " .. i })
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move window to workspace " .. i }
	)
end

hl.bind(mainMod .. "+ N", hl.dsp.focus({ workspace = "empty" }), { description = "Focus an empty workspace" })

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle scratchpad" })
hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.window.move({ workspace = "special:magic" }),
	{ description = "Move window to scratchpad" }
)

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Focus next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Focus previous workspace" })

-- Laptop multimedia keys for volume and LCD brightness
-- 6. Function keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { description = "Increase volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), { description = "Decrease volume" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"), { description = "Toggle mute" })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"), { description = "Increase screen brightness" })
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(ipc .. "brightness-down"),
	{ description = "Decrease screen brightness" }
)
